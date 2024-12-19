//
//  WCalendarView.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/21/24.
//

import SwiftUI
import HorizonCalendar


struct WCalendarView: View {
    @State var selectedDate: Date? = Date()
    @State var showSheet: Bool = false
    
    var body: some View {
        
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: Date())
        let startDate = Date()
        let endDate = calendar.date(from: DateComponents(year: currentYear + 1, month: 12, day: 31))!

        VStack {
            CalendarViewRepresentable(
              calendar: calendar,
              visibleDateRange: startDate...endDate,
              monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()),
              dataDependency: nil)
                .onDaySelection { day in
                    selectedDate = calendar.date(from: day.components)
                    showSheet = true
                }
                .days { [selectedDate] day in
                    let date = calendar.date(from: day.components)
                    let isSelected = calendar.isDate(date!, inSameDayAs: selectedDate!)
                    let borderColor: UIColor = isSelected ? .red : .clear
                    
                    Text("\(day.day)")
                      .font(.system(size: 18))
                      .foregroundColor(Color(UIColor.label))
                      .frame(maxWidth: .infinity, maxHeight: .infinity)
                      .overlay {
                        RoundedRectangle(cornerRadius: 12)
                          .fill(Color(borderColor))
                          .opacity(0.5)
                      }
                  }
                .layoutMargins(.init(top: 8, leading: 8, bottom: 8, trailing: 8))
                .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            if !Scheduled(date: selectedDate!).isEmpty {
                List(Scheduled(date: selectedDate!), id: \.description) { set in
                    VStack {
                        Text("\(set.title)").font(.title3)
                        Text("Sets: \(set.sets)").font(.subheadline)
                        Text("Reps: \(set.reps)")
                        ScrollView {
                            Text("Description: \(set.description)")
                        }.frame(height: 80)
                        
                    }
                }.frame(height: UIScreen.main.bounds.height / 3).background(.red.opacity(0.9)).scrollContentBackground(.hidden).cornerRadius(25)
            } else {
                Text("No Workout Today!")
                    .frame(height: UIScreen.main.bounds.height / 6)
            }
        }
    }
}

#Preview {
    WCalendarView()
}
