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
        }
        
        return interval
    }
}

private extension DateCalculator {
    func parseConveniently(fromSeconds seconds: Int) -> Interval {
        if seconds < minute {
            return Interval(value: seconds, unit: .second)
        }
        
        if seconds < hour {
            return Interval(value: seconds / minute, unit: .minute)
        }
        
        if seconds < day {
            return Interval(value: seconds / hour, unit: .hour)
        }
        
        if seconds < week {
            return Interval(value: seconds / day, unit: .day)
        }
        
        if seconds < month {
            return Interval(value: seconds / week, unit: .week)
        }
        
        return Interval(value: seconds / month, unit: .month)
    }
}
