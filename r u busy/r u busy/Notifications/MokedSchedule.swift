//
//  MokedSchedule.swift
//  r u busy
//
//  Created by Alex Freitas on 03/12/21.
//

import Foundation

struct MockedSchedule {
    static func getIntervals() -> [Double] {
        var intervals: [Double] = []
        var start: Double = 0.0

        for _ in 0...5 {
            let intervalInMinutes = Int.random(in: 5...10)
            let interval = start + Double(intervalInMinutes)
            intervals.append(interval)
            start = interval
        }

        intervals.sort()
        print(intervals)
        return intervals
    }
}
