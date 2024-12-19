//
//  SendNotification.swift
//  Fitbud
//
//  Created by Joshua Lai on 12/13/24.
//

import Foundation
import UserNotifications

func requestNotificationAuthorization() {
    let center = UNUserNotificationCenter.current()
    
    center.getNotificationSettings { settings in
        switch settings.authorizationStatus {
        case .notDetermined:
            center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                if granted {
                    print("Notification access granted.")
                } else {
                    print("Notification access denied.\(String(describing: error?.localizedDescription))")
                }
            }
            return
        case .denied:
            print("Notification access denied")
            return
        case .authorized:
            print("Notification access granted.")
            return
        default:
            return
        }
    }
}

func createCalendarNotification(title: String, body: String, dateComponents: DateComponents, identifier: String) {
    let notificationCenter = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound.default
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
    
    notificationCenter.removeDeliveredNotifications(withIdentifiers: [identifier])
    
    notificationCenter.add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error)")
        } else {
            print("Notification \(content.title) added")
        }
    }
}

func createMissingNotification(daysMissed: Int, dateComponents: DateComponents) {
    switch daysMissed {
    case 1:
        createCalendarNotification(title: "Come Back!", body: "You missed the last session, please come back!", dateComponents: dateComponents, identifier: "missingReminder1")
    case 3:
        createCalendarNotification(title: "Please Come Back!", body: "You missed the last session, please come back!", dateComponents: dateComponents, identifier: "missingReminder3")
    case 5:
        createCalendarNotification(title: "Your Pet Needs You!", body: "You've missed two feeding days, please come back!", dateComponents: dateComponents, identifier: "missingReminder5")
    case 7:
        createCalendarNotification(title: "Please Feed Me!", body: "Your pet is lacking in food!", dateComponents: dateComponents, identifier: "missingReminder7")
    case 9:
        createCalendarNotification(title: "Getting weaker...", body: "Your pet really needs food, please come back!", dateComponents: dateComponents, identifier: "missingReminder9")
    case 11:
        createCalendarNotification(title: "Pleaes help...", body: "Your pet is in dire need of food...", dateComponents: dateComponents, identifier: "missingReminder11")
    case 13:
        createCalendarNotification(title: "Last call...", body: "Your pet is about to die. There will be no further notifications...", dateComponents: dateComponents, identifier: "missingReminder13")
    default:
        print()
    }
}
