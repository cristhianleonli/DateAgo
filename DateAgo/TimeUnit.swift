//
//  TimeUnit.swift
//  Utilities
//
//  Created by Cristhian León
//  Copyright © 2018 Cristhian León. All rights reserved.
//

/// defines a unit of time
public struct TimeUnit: Equatable {

    public init(singular: String, plural: String) {
        self.singular = singular
        self.plural = plural
    }

    /// singular description for unit
    public var singular: String
    /// plural description for unit
    public var plural: String
    /// just wraps time units as a tuple
    public typealias Units = (second: TimeUnit, minute: TimeUnit,
        hour: TimeUnit, day: TimeUnit,
        week: TimeUnit, month: TimeUnit)

    public static func == (lhs: TimeUnit, rhs: TimeUnit) -> Bool {
        return lhs.singular.lowercased() == rhs.singular.lowercased() &&
        lhs.plural.lowercased() == rhs.plural.lowercased()
    }
}
