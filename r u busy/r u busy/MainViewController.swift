//
//  MainViewController.swift
//  r u busy
//
//  Created by Alex Freitas on 01/12/21.
//

import Foundation
import UIKit

protocol BusyTimesLabelDelegate: AnyObject {
    func updateBusyTimesValue()
}

class MainViewController: UIViewController {

    @IBOutlet weak var youWereBusyLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!

    let appNotification = AppNotifications()
    var busyTimesCounter: Int {
        return DataHandler().getBusyTimesCounter()
    }
    var appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate?.busyTimesDelegate = self
        updateBusyTimesValue()

        setNotifications()
    }

    private func setNotifications() {
        appNotification.configureNotification()

        MockedSchedule.getIntervals().forEach { interval in
            let date = Date().addingTimeInterval(interval)
            appNotification.setNotificationSchedule(date: date)
        }
    }
}

extension MainViewController: BusyTimesLabelDelegate {
    func updateBusyTimesValue() {
        numberLabel.text = "\(busyTimesCounter)"
    }
}
