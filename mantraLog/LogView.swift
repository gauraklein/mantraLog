//
//  LogView.swift
//  mantraLog
//
//  Created by Gaura Klein on 9/18/25.
//

import SwiftUI

struct LogView: View {
    var body: some View {
        ScheduleView { date in
            print("Date selected: \(date)")
        }
        .padding()
    }
}

#Preview {
    LogView()
}
