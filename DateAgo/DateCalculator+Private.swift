//
//  DateCalculator+Private.swift
//  DateAgo
//
//  Created by Cristhian Leon on 27.03.19.
//  Copyright © 2019 Cristhian León. All rights reserved.
//

import Foundation

internal extension DateCalculator {
    func calculateSecondsAgo(from date: Date) -> Int {
        let secondsAgo = Int(Date().timeIntervalSince(date))
        return secondsAgo
    }
    
    func parseSeconds(value seconds: Int, to timeUnit: Interval.TimeUnit?) -> Interval {
        guard let unit = timeUnit else {
            return parseConveniently(fromSeconds: seconds)
        }
        
        var interval = Interval(value: seconds, unit: unit)
        
        switch unit {
        case .second:
            interval.value = seconds
        case .minute:
            interval.value = seconds / minute
        case .hour:
            interval.value = seconds / hour
        case .day:
            interval.value = seconds / day
        case .week:
            interval.value = seconds / week
        case .month:
            interval.value = seconds / month
        case .year:
            interval.value = seconds / year
        }
        
        return interval
    }
}

private extension DateCalculator {
    func parseConveniently(fromSeconds seconds: Int) -> Interval {
        switch seconds {
        case 0..<minute:
            return Interval(value: seconds, unit: .second)
        case minute..<hour:
            return Interval(value: seconds / minute, unit: .minute)
        case hour..<day:
            return Interval(value: seconds / hour, unit: .hour)
        case day..<week:
            return Interval(value: seconds / day, unit: .day)
        case week..<month:
            return Interval(value: seconds / week, unit: .week)
        case month..<year:
            return Interval(value: seconds / month, unit: .month)
        default:
            return Interval(value: seconds / year, unit: .year)
        }
    }
}
