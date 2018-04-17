//
//  TimeAgoLanguage.swift
//  Utilities
//
//  Created by Cristhian León
//  Copyright © 2018 Cristhian León. All rights reserved.
//

public struct TimeLanguage {

    /// name for seconds unit
    public var second: TimeUnit

    /// name for minut unit
    public var minute: TimeUnit

    /// name for hour unit
    public var hour: TimeUnit

    /// name for day unit
    public var day: TimeUnit

    /// name for week unit
    public var week: TimeUnit

    /// name for month unit
    public var month: TimeUnit

    /// time ago text
    public var timeAgoText: TimeAgo

    /**
     Abstraction of unit times, just to not use an array and index it
     - Returns: tuple of time units
     */
    public func getUnits() -> TimeUnit.Units {
        return (second, minute, hour, day, week, month)
    }

    /// english language configuration for time ago
    public static var english: TimeLanguage {

        let timeAgo = TimeAgo(position: .pos, text: "ago", momentAgoText: "Just now")
        return TimeLanguage(second: TimeUnit(singular: "second", plural: "seconds"),
                               minute: TimeUnit(singular: "minute", plural: "minutes"),
                               hour: TimeUnit(singular: "hour", plural: "hours"),
                               day: TimeUnit(singular: "day", plural: "days"),
                               week: TimeUnit(singular: "week", plural: "weeks"),
                               month: TimeUnit(singular: "month", plural: "months"),
                               timeAgoText: timeAgo)
    }

    /// spanish language configuration for time ago
    public static var spanish: TimeLanguage {
        let timeAgo = TimeAgo(position: .pre, text: "Hace", momentAgoText: "Hace un momento")
        return TimeLanguage(second: TimeUnit(singular: "segundo", plural: "segundos"),
                               minute: TimeUnit(singular: "minuto", plural: "minutos"),
                               hour: TimeUnit(singular: "hora", plural: "horas"),
                               day: TimeUnit(singular: "día", plural: "días"),
                               week: TimeUnit(singular: "semana", plural: "semanas"),
                               month: TimeUnit(singular: "mes", plural: "meses"),
                               timeAgoText: timeAgo)
    }
}
