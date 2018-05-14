//
//  DateAgo.swift
//  Utilities
//
//  Created by Cristhian León
//  Copyright © 2018 Cristhian León. All rights reserved.
//

import UIKit

public extension Date {
    /**
     Shows the time ago in english by default
     - Parameter lang: defines all the caracteristics of language for time
     - Returns: the string indicating the time ago
     */
    public func timeAgoDisplay(withLanguage lang: TimeLanguage = .english) -> String {
        let (quotient, unit) = getUnitAndQuotient(units: lang.getUnits())
        return formatTimeString(timeAgo: lang.timeAgoText, quotient: quotient, unit: unit)
    }

    /**
     Creates unit and quotient values
     - Parameter units: the compilation of units of language
     - Returns: zip with value of time, and the correct unit
     */
    internal func getUnitAndQuotient(units: TimeUnit.Units) -> (Int, TimeUnit) {

        let secondsAgo = Int(Date().timeIntervalSince(self))

        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week

        if secondsAgo < minute {
            return (secondsAgo, units.second)
        } else if secondsAgo < hour {
            return (secondsAgo / minute, units.minute)
        } else if secondsAgo < day {
            return (secondsAgo / hour, units.hour)
        } else if secondsAgo < week {
            return (secondsAgo / day, units.day)
        } else if secondsAgo < month {
            return (secondsAgo / week, units.week)
        }
        return (secondsAgo / month, units.month)
    }

    /**
     Returns the formatted string according language and time unit
     - Parameter lang: definition of language
     - Parameter quotient: amount of time
     - Parameter unit: unit of time
     - Returns: formatted string according time
     */
    internal func formatTimeString(timeAgo: TimeAgo, quotient: Int, unit: TimeUnit) -> String {
        var text = ""

        if let agoText = timeAgo.text, let position = timeAgo.position,
            position == .pre {
            text.append("\(agoText) ")
        }

        text.append("\(quotient)")
        if quotient == 0, let momentAgo = timeAgo.momentAgoText {
            return momentAgo
        }

        text.append(" ")
        text += (quotient > 1 || quotient == 0) ? unit.plural : unit.singular

        if let agoText = timeAgo.text, let position = timeAgo.position,
            position == .pos {
            text.append(" \(agoText)")
        }

        return text
    }
}
