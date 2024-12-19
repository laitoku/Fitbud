//
//  UpdateMetrics.swift
//  Fitbud
//
//  Created by Joshua Lai on 12/13/24.
//

import Foundation

func UpdateMetrics() {
    var titles: [String] = []
    var sets: [Int] = []
    var reps: [Int] = []
    
    for set in Scheduled(date: Date()) {
        titles.append(set.title)
        sets.append(set.sets)
        reps.append(set.reps)
    }

    let d = DatabaseHelper()
    if let db = d.openDatabase() {
        for i in 0...2 {
            let row = d.retrieveRow(byID: 0, title: titles[i], db: db)
            let total: Int = row!["total"] as! Int + (sets[i] * reps[i])
            d.updateTotal(forTitle: titles[i], newTotal: total, db: db)
        }
        d.closeDatabase(db)
    }
    
    let s = decodeSchedule()
    var z = s
    
    z = Array(s.dropFirst())
    
    
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(z)
        UserDefaults.standard.set(data, forKey: "schedule")
    } catch {
        print("Encode Failed: \(error)")
    }
    
    
    var streak: Int = UserDefaults.standard.integer(forKey: "streak")
    streak += 1
    UserDefaults.standard.set(streak, forKey: "streak")
    
    var completedDays: Int = UserDefaults.standard.integer(forKey: "completedDays")
    completedDays += 1
    UserDefaults.standard.set(completedDays, forKey: "completedDays")
    
    var missedDays: Int = UserDefaults.standard.integer(forKey: "missedDays")
    missedDays += 1
    UserDefaults.standard.set(missedDays, forKey: "missedDays")
    
    UserDefaults.standard.set(true, forKey: "dayComplete")
    UserDefaults.standard.set(Date(), forKey: "day")
    
    var dateComponents = DateComponents()
    dateComponents.calendar = Calendar.current
    dateComponents.month = Calendar.current.component(.month, from: Date())
    dateComponents.day = Calendar.current.component(.day, from: Date()) + 2
    dateComponents.hour = Calendar.current.component(.hour, from: Date())
    
    createCalendarNotification(
        title: "Time to Workout!",
        body: "You have a workout session to complete today!",
        dateComponents: dateComponents,
        identifier: "DailyReminder"
    )
    
    
    
}
