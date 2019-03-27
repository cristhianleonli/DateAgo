//
//  DateCalculator.swift
//  DateAgo
//
//  Created by Cristhian Leon on 27.03.19.
//  Copyright © 2019 Cristhian León. All rights reserved.
//

import Foundation

struct DateCalculator {
    
    let minute = 60
    let hour = 3_600
    let day = 86_400
    let week = 604_800
    let month = 2_419_200
    let year = 29_030_400
    
    private init() {
    }
    
    static func getUnitAndQuotient(from date: Date, as unit: Interval.TimeUnit) -> Interval {
        let instance = DateCalculator()
        let seconds = instance.calculateSecondsAgo(from: date)
        let interval = instance.parseSeconds(value: seconds, to: unit)
        return interval
    }
    
    static func getUnitAndQuotient(from date: Date) -> Interval {
        let instance = DateCalculator()
        let seconds = instance.calculateSecondsAgo(from: date)
        let convenienceInterval = instance.parseSeconds(value: seconds, to: nil)
        return convenienceInterval
    }
}
