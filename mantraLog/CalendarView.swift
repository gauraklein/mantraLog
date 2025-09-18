//
//  CalendarView.swift
//  mantraLog
//
//  Created by Gaura Klein on 9/18/25.
//

import SwiftUI

struct CalendarView: View {
    @State private var currentMonth = Date.now
    @State private var selectedDate = Date.now
    @State private var selectedHour = Date.now
    @State private var days: [Date] = []
    
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var onDateSelected: (Date, Date) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            // Month navigation
            HStack {
                Text(currentMonth.formatted(.dateTime.year().month()))
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.primary) // adapts to light/dark
                Spacer()
                Button {
                    currentMonth = Calendar.current.date(byAdding: .month, value: -1, to: currentMonth)!
                    updateDays()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundStyle(.tint) // uses accent color
                }
                Button {
                    currentMonth = Calendar.current.date(byAdding: .month, value: 1, to: currentMonth)!
                    updateDays()
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundStyle(.tint)
                }
            }
            
            // Days of the week row
            HStack {
                ForEach(daysOfWeek.indices, id: \.self) { index in
                    Text(daysOfWeek[index])
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.secondary) // lighter, adapts to theme
                        .frame(maxWidth: .infinity)
                }
            }
            
            // Grid of days
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(days, id: \.self) { day in
                    Button {
                        if day >= Date.now.startOfDay && day.monthInt == currentMonth.monthInt {
                            selectedDate = day
                            onDateSelected(selectedDate, selectedHour)
                        }
                    } label: {
                        Text(day.formatted(.dateTime.day()))
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(foregroundStyle(for: day))
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background{
                                if day.formattedDate == selectedDate.formattedDate {
                                    Circle().foregroundStyle(.tint)
                                }
                            }
                    }
                    .disabled(day < Date.now.startOfDay || day.monthInt != currentMonth.monthInt)
                }
            }
            
            // Time picker
            DatePicker(
                "",
                selection: $selectedHour,
                displayedComponents: [.hourAndMinute]
            )
            .onChange(of: selectedHour) {
                onDateSelected(selectedDate, selectedHour)
            }
            .datePickerStyle(.compact)
        }
        .padding()
        .onAppear {
            updateDays()
            onDateSelected(selectedDate, selectedHour)
        }
    }
    
    private func updateDays() {
        days = currentMonth.calendarDisplayDays
    }
    
    private func foregroundStyle(for day: Date) -> Color {
        let isDifferentMonth = day.monthInt != currentMonth.monthInt
        let isSelectedDate = day.formattedDate == selectedDate.formattedDate
        let isPastDate = day < Date.now.startOfDay
        
        if isDifferentMonth {
            return .secondary
        } else if isPastDate {
            return .secondary.opacity(0.5)
        } else {
            return isSelectedDate ? .white : .primary
        }
    }
}
