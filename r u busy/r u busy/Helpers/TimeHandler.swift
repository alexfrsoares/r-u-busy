//
//  TimeHandler.swift
//  r u busy
//
//  Created by Alex Freitas on 01/12/21.
//

import Foundation

struct TimeHandler {
    static let dateFormatter = DateFormatter()
    static private let secondsInOneDay = 60 * 60 * 24

    static func daysToSeconds(totalDays: Int) -> Int {
        let result = secondsInOneDay * totalDays
        return result
    }

    static func secondsToDays(totalSeconds: Int) -> Int {
        let result = totalSeconds / secondsInOneDay
        return result
    }

    static func stringToDate(string: String) -> Date {
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        dateFormatter.dateFormat = "dd-MM-yyyy"
        guard let date = dateFormatter.date(from: string) else {
            return Date()
        }
        return date
    }

    static func dateToString(date: Date) -> String {
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }

    static func dateToStringComparable(date: Date) -> String {
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.string(from: date)
    }

    static func getComponents(date: Date) -> DateComponents {
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        return components
    }

    static func addOneDay(date: Date) -> Date {
        let datePlusOneDay = date.addingTimeInterval(TimeInterval(daysToSeconds(totalDays: 1)))
        return datePlusOneDay
    }

    static func addTimeIntervalInDays(dateString: String, totalDays: Int) -> Date {
        let actualDate = stringToDate(string: dateString)
        let intervalInSeconds = daysToSeconds(totalDays: totalDays)
        let newDate = actualDate.addingTimeInterval(TimeInterval(intervalInSeconds))
        return newDate
    }

    static func intervalBetweenDates(firstDate: Date, secondDate: Date) -> Int {
        let intervalInSeconds = secondDate.timeIntervalSince(firstDate)
        let intervalInDays = TimeHandler.secondsToDays(totalSeconds: Int(intervalInSeconds))

        return intervalInDays
    }

    static func intervalBetweenStringDates(firstDate: String, secondDate: String) -> Int {
        let dateA = TimeHandler.stringToDate(string: firstDate)
        let dateB = TimeHandler.stringToDate(string: secondDate)
        let intervalInSeconds = dateB.timeIntervalSince(dateA)
        let intervalInDays = TimeHandler.secondsToDays(totalSeconds: Int(intervalInSeconds))

        return intervalInDays
    }
}
