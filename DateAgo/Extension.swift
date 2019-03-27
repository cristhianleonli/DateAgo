//
//  DateAgo.swift
//  Utilities
//
//  Created by Cristhian León
//  Copyright © 2018 Cristhian León. All rights reserved.
//

import UIKit

public extension Date {
    public func timeAgo(as unit: Interval.TimeUnit) -> Interval {
        return DateCalculator.getUnitAndQuotient(from: self, as: unit)
    }
    
    public func timeAgo() -> Interval {
        return DateCalculator.getUnitAndQuotient(from: self)
    }
}
