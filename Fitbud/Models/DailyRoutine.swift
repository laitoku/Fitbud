//
//  Routine.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/15/24.
//

import Foundation

struct DailyRoutine {
    var title: String
    var sets: [String]
    var lengthInMinutes: Int
    var theme: Theme
}

extension DailyRoutine {
    static let sampleData: [DailyRoutine] =
    [
        DailyRoutine(title: "Design",
                   sets: ["Cathy", "Daisy", "Simon", "Jonathan"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyRoutine(title: "App Dev",
                   sets: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyRoutine(title: "Web Dev",
                   sets: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
}
