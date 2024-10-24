//
//  Schedule.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/21/24.
//

import Foundation

let sampleSchedule: [DailySets] = [
    DailySets(sets: [
        DailySets.Set(description: "Bench Press", reps: 10, time: 30),
        DailySets.Set(description: "Squats", reps: 12, time: 40),
        DailySets.Set(description: "Deadlift", reps: 8, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 23))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Pull Ups", reps: 8, time: 25),
        DailySets.Set(description: "Leg Press", reps: 10, time: 30),
        DailySets.Set(description: "Shoulder Press", reps: 12, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 24))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bicep Curls", reps: 10, time: 20),
        DailySets.Set(description: "Tricep Dips", reps: 12, time: 25),
        DailySets.Set(description: "Lunges", reps: 15, time: 30),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 27))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bench Press", reps: 10, time: 30),
        DailySets.Set(description: "Squats", reps: 12, time: 40),
        DailySets.Set(description: "Deadlift", reps: 8, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 30))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Pull Ups", reps: 8, time: 25),
        DailySets.Set(description: "Leg Press", reps: 10, time: 30),
        DailySets.Set(description: "Shoulder Press", reps: 12, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 2))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bicep Curls", reps: 10, time: 20),
        DailySets.Set(description: "Tricep Dips", reps: 12, time: 25),
        DailySets.Set(description: "Lunges", reps: 15, time: 30),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 5))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bench Press", reps: 10, time: 30),
        DailySets.Set(description: "Squats", reps: 12, time: 40),
        DailySets.Set(description: "Deadlift", reps: 8, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 8))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Pull Ups", reps: 8, time: 25),
        DailySets.Set(description: "Leg Press", reps: 10, time: 30),
        DailySets.Set(description: "Shoulder Press", reps: 12, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 11))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bicep Curls", reps: 10, time: 20),
        DailySets.Set(description: "Tricep Dips", reps: 12, time: 25),
        DailySets.Set(description: "Lunges", reps: 15, time: 30),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 14))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bench Press", reps: 10, time: 30),
        DailySets.Set(description: "Squats", reps: 12, time: 40),
        DailySets.Set(description: "Deadlift", reps: 8, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 17))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Pull Ups", reps: 8, time: 25),
        DailySets.Set(description: "Leg Press", reps: 10, time: 30),
        DailySets.Set(description: "Shoulder Press", reps: 12, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 20))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bicep Curls", reps: 10, time: 20),
        DailySets.Set(description: "Tricep Dips", reps: 12, time: 25),
        DailySets.Set(description: "Lunges", reps: 15, time: 30),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 23))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bench Press", reps: 10, time: 30),
        DailySets.Set(description: "Squats", reps: 12, time: 40),
        DailySets.Set(description: "Deadlift", reps: 8, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 26))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Pull Ups", reps: 8, time: 25),
        DailySets.Set(description: "Leg Press", reps: 10, time: 30),
        DailySets.Set(description: "Shoulder Press", reps: 12, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 29))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bicep Curls", reps: 10, time: 20),
        DailySets.Set(description: "Tricep Dips", reps: 12, time: 25),
        DailySets.Set(description: "Lunges", reps: 15, time: 30),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 2))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bench Press", reps: 10, time: 30),
        DailySets.Set(description: "Squats", reps: 12, time: 40),
        DailySets.Set(description: "Deadlift", reps: 8, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 5))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Pull Ups", reps: 8, time: 25),
        DailySets.Set(description: "Leg Press", reps: 10, time: 30),
        DailySets.Set(description: "Shoulder Press", reps: 12, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 8))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bicep Curls", reps: 10, time: 20),
        DailySets.Set(description: "Tricep Dips", reps: 12, time: 25),
        DailySets.Set(description: "Lunges", reps: 15, time: 30),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 11))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Bench Press", reps: 10, time: 30),
        DailySets.Set(description: "Squats", reps: 12, time: 40),
        DailySets.Set(description: "Deadlift", reps: 8, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 14))!),
    
    DailySets(sets: [
        DailySets.Set(description: "Pull Ups", reps: 8, time: 25),
        DailySets.Set(description: "Leg Press", reps: 10, time: 30),
        DailySets.Set(description: "Shoulder Press", reps: 12, time: 35),
    ], date: Calendar.current.date(from: DateComponents(year: 2024, month: 12, day: 17))!)
]
