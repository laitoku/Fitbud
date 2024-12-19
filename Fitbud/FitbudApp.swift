//
//  FitbudApp.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/15/24.
//

import SwiftUI
import BackgroundTasks

@main
struct FitbudApp: App {
    let defaults = UserDefaults.standard
    
    init() {
        checkFirstLaunch()
        if defaults.integer(forKey: "missedDays") > 0 {
            defaults.set(0, forKey: "streak")
            SkipMissingDays()
        }
    }
    
    func checkFirstLaunch() {
        if !defaults.bool(forKey: "hasLaunchedBefore") {
            requestNotificationAuthorization()
            defaults.set(true, forKey: "hasLaunchedBefore")
            defaults.set(0, forKey: "streak")
            defaults.set(0, forKey: "completedDays")
            defaults.set(0, forKey: "missedDays")
            defaults.set(false, forKey: "dayComplete")
            defaults.set(Date(), forKey: "day")
            defaults.set(0, forKey: "PetStage")
            defaults.set(0, forKey: "PetHunger")
            defaults.set(0, forKey: "Food")
            defaults.set(0, forKey: "Gift")
            genSchedule(date: Date())
        }
    }
    
    
    func runBackground() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "missing.refresh", using: nil) { task in
             self.handleAppRefresh(task: task as! BGAppRefreshTask)
        }
        
        
        let request = BGAppRefreshTaskRequest(identifier: "missing.refresh")
        
        // Fetch no earlier than 1 hour from now.
        request.earliestBeginDate = Date().addingTimeInterval(3600)
                
           do {
              try BGTaskScheduler.shared.submit(request)
           } catch {
              print("Could not schedule app refresh: \(error)")
           }
    }
    
    func handleAppRefresh(task: BGAppRefreshTask) {
        let day = defaults.object(forKey: "day")
        let targetDate = Calendar.current.date(byAdding: .day, value: 3, to: day as! Date)!
        
        if Date() > targetDate {
            let x = defaults.integer(forKey: "missedDays")
            let hunger = defaults.integer(forKey: "PetHunger")
            defaults.set(x + 1, forKey: "missedDays")
            defaults.set(hunger + 1, forKey: "PetHunger")
        }
        var dateC = DateComponents()
        dateC.calendar = Calendar.current
        dateC.month = Calendar.current.component(.month, from: Date())
        dateC.day = Calendar.current.component(.day, from: Date())
        dateC.hour = 7
        createMissingNotification(daysMissed: defaults.integer(forKey: "missedDays"), dateComponents: dateC)
        
        task.setTaskCompleted(success: true)
    }

    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
