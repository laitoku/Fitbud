//
//  Schedule.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/21/24.
//

import Foundation

struct DailySets {
    var sets: Array<Set>
    var date: Date
    
    struct Set {
        var description: String
        var reps: Int
        var time: Int
    }
}

