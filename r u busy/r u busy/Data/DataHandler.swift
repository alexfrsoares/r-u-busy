//
//  DataHandler.swift
//  r u busy
//
//  Created by Alex Freitas on 03/12/21.
//

import Foundation

class DataHandler {
    func trackedIf(isBusy: Bool) {
        let tracked = TrackedTime(context: DataManager().context)
        tracked.date = Date()
        tracked.isBusy = isBusy
        DataManager().saveData()
    }

    func getBusyTimesCounter() -> Int {
        let trackedTimes = DataManager().loadData()
        var busyTimes: [TrackedTime] = []

        for tracked in trackedTimes {
            if tracked.isBusy {
                busyTimes.append(tracked)
            }
        }

        return busyTimes.count
    }
}
