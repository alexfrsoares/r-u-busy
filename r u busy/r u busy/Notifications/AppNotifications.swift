//
//  AppNotifications.swift
//  r u busy
//
//  Created by Alex Freitas on 01/12/21.
//

import Foundation
import UserNotifications

class AppNotifications {
    let notificationCenter = UNUserNotificationCenter.current()
    let delegate = UNUserNotificationCenterDelegate.self

    // Define the custom actions.
    let confirmAction = UNNotificationAction(identifier: "CONFIRM_ACTION",
          title: "Yes",
          options: [])
    let denyAction = UNNotificationAction(identifier: "DENY_ACTION",
          title: "No",
          options: [])

    let content = UNMutableNotificationContent()

    func configuringNotifications() {
        notificationCenter.requestAuthorization(options: [.alert, .sound]) {
            (granted, error) in
        }

        // Define the notification type
        let areYouBusyCategory =
              UNNotificationCategory(identifier: "ARE_YOU_BUSY_QUESTION",
              actions: [confirmAction, denyAction],
              intentIdentifiers: [],
              hiddenPreviewsBodyPlaceholder: "",
              options: .customDismissAction)

        // Register the notification type.
        notificationCenter.setNotificationCategories([areYouBusyCategory])
    }

    func configureNotification() {
        content.title = "Are you busy?"
        content.body = "Please confirm that you are currently doing something."
        content.categoryIdentifier = "ARE_YOU_BUSY_QUESTION"
    }

    func setSchedule() {
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

        notificationCenter.add(request) { (error) in
            //
        }
    }
}
