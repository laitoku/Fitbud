//
//  Schedule.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/21/24.
//

import Foundation

var sampleSchedule: [DailySets] = []
var lastExercise: Int = 0

func genSchedule (date: Date) {
    var currentDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: date))
    var dateComponents = DateComponents()
    dateComponents.calendar = Calendar.current
    
    let d = DatabaseHelper()
    let db = d.openDatabase()
    sampleSchedule = []
    var w: [String: Any]
    var ex: DailySets.Exercise
    var daily: [DailySets.Exercise] = []
    var prog = 0
    
    for i in 1...26 {
        if i % 8 == 0 {
            prog += 1
        }
        if i % 3 == 1 {
            daily = []
            for j in 1...3 {
                w = d.retrieveRow(byID: j, db: db!)!
                ex = DailySets.Exercise(id: w["id"] as! Int, title: w["title"] as! String, description: w["description"] as! String, sets: (w["sets"] as! Int) + prog, reps: w["reps"] as! Int, total: w["total"] as! Int)
                daily.append(ex)
            }
            sampleSchedule.append(DailySets(workout: daily, date: currentDate!))
        }
        else if i % 3 == 2 {
            daily = []
            for j in 4...6 {
                w = d.retrieveRow(byID: j, db: db!)!
                ex = DailySets.Exercise(id: w["id"] as! Int, title: w["title"] as! String, description: w["description"] as! String, sets: (w["sets"] as! Int) + prog, reps: w["reps"] as! Int, total: w["total"] as! Int)
                daily.append(ex)
            }
            sampleSchedule.append(DailySets(workout: daily, date: currentDate!))
        }
        else if i % 3 == 0 {
            daily = []
            for j in 7...9 {
                w = d.retrieveRow(byID: j, db: db!)!
                ex = DailySets.Exercise(id: w["id"] as! Int, title: w["title"] as! String, description: w["description"] as! String, sets: (w["sets"] as! Int) + prog, reps: w["reps"] as! Int, total: w["total"] as! Int)
                daily.append(ex)
            }
            sampleSchedule.append(DailySets(workout: daily, date: currentDate!))
        }

        currentDate = Calendar.current.date(byAdding: .day, value: 2, to: currentDate!)

    }
    
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(sampleSchedule)
        UserDefaults.standard.set(data, forKey: "schedule")
    } catch {
        print("Encode Failed: \(error)")
    }
}

func decodeSchedule() -> [DailySets] {
    if let savedData = UserDefaults.standard.data(forKey: "schedule") {
        let decoder = JSONDecoder()
        do {
            // Decode the Data back into the array of structs
            let decodedProfiles = try decoder.decode([DailySets].self, from: savedData)
            return decodedProfiles
        } catch {
            print("Failed to decode profiles: \(error)")
        }
    }
    return []
}
