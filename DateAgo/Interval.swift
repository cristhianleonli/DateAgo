//
//  Interval.swift
//  DateAgo
//
//  Created by Cristhian Leon on 27.03.19.
//  Copyright © 2019 Cristhian León. All rights reserved.
//

public struct Interval: CustomStringConvertible {
    public var value: Int
    public var unit: TimeUnit
    
    public var description: String {
        return "Interval(value: \(value), unit: \(unit))"
    }
    
    public enum TimeUnit {
        case second
        case minute
        case hour
        case day
        case week
        case month
        case year
    }
    
    public init() {
        self.value = 0
        self.unit = .second
    }
    
    public init(value: Int, unit: TimeUnit) {
        self.value = value
        self.unit = unit
    }
}
