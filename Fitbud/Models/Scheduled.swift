//
//  Schedule.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/21/24.
//

import Foundation

func Scheduled(date: Date) -> Array<DailySets.Exercise> {
    let currentDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: date))
    
    for dailySet in decodeSchedule() {
        if dailySet.date == currentDate {
            return dailySet.workout
        }
    }
    return []
}
