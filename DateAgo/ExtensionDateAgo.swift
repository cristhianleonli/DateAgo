//
//import Foundation
//
//public extension Date {
//    public func timeAgo(as unit: Interval.TimeUnit) -> Interval {
//        return DateCalculator.getUnitAndQuotient(from: self, as: unit)
//    }
//    
//    public func timeAgo() -> Interval {
//        return DateCalculator.getUnitAndQuotient(from: self)
//    }
//}
//
//public struct Interval {
//    public var value: Int
//    public var unit: TimeUnit
//
//    public enum TimeUnit {
//        case second
//        case minute
//        case hour
//        case day
//        case week
//        case month
//    }
//
//    public init() {
//        self.value = 0
//        self.unit = .second
//    }
//
//    public init(value: Int, unit: TimeUnit) {
//        self.value = value
//        self.unit = unit
//    }
//}
//
//struct DateCalculator {
//
//    let minute = 60
//    let hour = 3_600
//    let day = 86_400
//    let week = 604_800
//    let month = 2_419_200
//
//    private init() {
//    }
//
//    static func getUnitAndQuotient(from date: Date, as unit: Interval.TimeUnit) -> Interval {
//        let instance = DateCalculator()
//        let seconds = instance.calculateSecondsAgo(from: date)
//        let interval = instance.parseSeconds(value: seconds, to: unit)
//        return interval
//    }
//
//    static func getUnitAndQuotient(from date: Date) -> Interval {
//        let instance = DateCalculator()
//        let seconds = instance.calculateSecondsAgo(from: date)
//        let convenienceInterval = instance.parseSeconds(value: seconds, to: nil)
//        return convenienceInterval
//    }
//}
//
//internal extension DateCalculator {
//    func calculateSecondsAgo(from date: Date) -> Int {
//        let secondsAgo = Int(Date().timeIntervalSince(date))
//        return secondsAgo
//    }
//
//    func parseSeconds(value seconds: Int, to timeUnit: Interval.TimeUnit?) -> Interval {
//        guard let unit = timeUnit else {
//            return parseConveniently(fromSeconds: seconds)
//        }
//
//        var interval = Interval(value: seconds, unit: unit)
//
//        switch unit {
//        case .second:
//            interval.value = seconds
//        case .minute:
//            interval.value = seconds / minute
//        case .hour:
//            interval.value = seconds / hour
//        case .day:
//            interval.value = seconds / day
//        case .week:
//            interval.value = seconds / week
//        case .month:
//            interval.value = seconds / month
//        }
//
//        return interval
//    }
//}
//
//private extension DateCalculator {
//    func parseConveniently(fromSeconds seconds: Int) -> Interval {
//        if seconds < minute {
//            return Interval(value: seconds, unit: .second)
//        }
//
//        if seconds < hour {
//            return Interval(value: seconds / minute, unit: .minute)
//        }
//
//        if seconds < day {
//            return Interval(value: seconds / hour, unit: .hour)
//        }
//
//        if seconds < week {
//            return Interval(value: seconds / day, unit: .day)
//        }
//
//        if seconds < month {
//            return Interval(value: seconds / week, unit: .week)
//        }
//
//        return Interval(value: seconds / month, unit: .month)
//    }
//}
