//
//  Schedule.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/21/24.
//

import Foundation

func Scheduled(date: Date) -> Array<DailySets.Set> {
    let currentDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: date))
    
    for dailySet in sampleSchedule {
        if dailySet.date == currentDate {
            return dailySet.sets
        }
    }
    
    return []
}
