//
//  ScheduleView.swift
//  mantraLog
//
//  Created by Gaura Klein on 9/18/25.
//

import SwiftUI

struct ScheduleView: View {
    @State private var selectedSessionDate: Date = Date.now
    @State private var selectedSessionHour: Date = Date.now
    
    var onDateSelected: (String) -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            VStack {
                Text("Mantra Log")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.primary)
                    .textCase(.uppercase)
            }
            
            CalendarView { selectedDate, selectedHour in
                self.selectedSessionDate = selectedDate
                self.selectedSessionHour = selectedHour
            }
            
            HStack {
                Spacer()
                Button {
                    let combinedDate = Calendar.current.date(
                        bySettingHour: selectedSessionHour.hourInt,
                        minute: selectedSessionHour.minuteInt,
                        second: 0,
                        of: selectedSessionDate
                    ) ?? selectedSessionDate
                    
                    onDateSelected(combinedDate.formattedDateHourCombined)
                } label: {
                    Image(systemName: "checkmark")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.blue)
                        .padding()
                        .background(
                            Circle()
                                .stroke(.blue, lineWidth: 2)
                                .fill(.blue.opacity(0.1))
                        )
                }
            }
            Spacer()
        }
    }
}
