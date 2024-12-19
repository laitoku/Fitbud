//
//  Schedule.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/21/24.
//

import Foundation

struct DailySets: Codable {
    var workout: [Exercise]
    var date: Date
    
    struct Exercise: Codable {
        var id: Int
        var title: String
        var description: String
        var sets: Int
        var reps: Int
        var total: Int
    }
}

