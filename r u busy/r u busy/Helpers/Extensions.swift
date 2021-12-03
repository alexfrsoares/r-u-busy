//
//  Extensions.swift
//  r u busy
//
//  Created by Alex Freitas on 01/12/21.
//

import Foundation

extension Date {
    func getComponents() -> DateComponents {
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        return components
    }

    func yesterday() -> Date {
        let oneDayInSeconds = TimeInterval(24 * 60 * 60)
        let yesterday = self.addingTimeInterval(-oneDayInSeconds)
        return yesterday
    }

    func startDate() -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.hour = 0
        components.minute = 0
        components.second = 0
        return Calendar.current.date(from: components) ?? self
    }

    func endDate() -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.hour = 23
        components.minute = 59
        components.second = 59
        return Calendar.current.date(from: components) ?? self
    }
}
