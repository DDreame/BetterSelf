//
//  CalendarTestView1.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/3.
//

import SwiftUI
import HorizonCalendar

// 自定义的SwiftUI视图，用于包装HorizonCalendar的CalendarView
struct CustomCalendarView: View {
    @State private var calendarViewContent: CalendarViewContent?
    
    var body: some View {
        return CalendarViewContent(makeContent())

          .dayItemProvider { day in
            Text("\(day.day)")
              .font(.system(size: 18))
              .foregroundColor(Color(UIColor.darkGray))
              .calendarItemModel
          }
    }
    private func makeContent() -> CalendarViewContent {
      return CalendarViewContent(
        calendar: calendar,
        visibleDateRange: today...endDate,
        monthsLayout: .vertical(VerticalMonthsLayoutOptions()))
        
        .dayItemProvider { day in
          // Return a `CalendarItemModel` representing the view for each day
        }
    }
}

@main
struct CalendarApp: App {
    var body: some Scene {
        WindowGroup {
            CustomCalendarView()
        }
    }
}
