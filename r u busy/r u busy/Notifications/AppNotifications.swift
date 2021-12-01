//
//  AppNotifications.swift
//  r u busy
//
//  Created by Alex Freitas on 01/12/21.
//

import Foundation
import UserNotifications

class AppNotifications {
    let center = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()

    func askForPermission() {
        center.requestAuthorization(options: [.alert, .sound]) {
            (granted, error) in
        }
    }

    func configureNotification() {
        content.title = "Notificado"
        content.body = "Funcionou"
    }

    func setSchedule() {
        let date = Date().addingTimeInterval(10)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

        center.add(request) { (error) in
            //
        }
    }
}
