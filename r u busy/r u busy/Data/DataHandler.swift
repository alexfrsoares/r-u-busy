//
//  DataHandler.swift
//  r u busy
//
//  Created by Alex Freitas on 03/12/21.
//

import Foundation

class DataHandler {
    func tracked(isBusy: Bool) {
        let trackedTime = TrackedTime(context: DataManager().context)
        trackedTime.date = Date()
        trackedTime.isBusy = isBusy
        DataManager().saveData()
    }
}
