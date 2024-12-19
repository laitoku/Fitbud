//
//  SkipDay.swift
//  Fitbud
//
//  Created by Joshua Lai on 11/29/24.
//

import Foundation

func SkipDay(days: Int = 1) {
    var s = decodeSchedule()
    
    for i in s.indices {
        s[i].date = Calendar.current.date(byAdding: .day, value: days, to: s[i].date)!
    }
    
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(s)
        UserDefaults.standard.set(data, forKey: "schedule")
    } catch {
        print("Encode Failed: \(error)")
    }
    
    UserDefaults.standard.set(Date(), forKey: "day")
}

func SkipMissingDays() {
    var s = decodeSchedule()
    var currentDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: Date()))
    currentDate = Calendar.current.date(byAdding: .day, value: -2, to: currentDate!)!
    
    for i in s.indices {
        s[i].date = Calendar.current.date(byAdding: .day, value: 2, to: s[i].date)!
    }
    
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(s)
        UserDefaults.standard.set(data, forKey: "schedule")
    } catch {
        print("Encode Failed: \(error)")
    }
}
