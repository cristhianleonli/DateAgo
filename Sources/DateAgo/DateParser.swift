import Foundation

struct DateParser {
    
    private static let minute = 60
    private static let hour = 60 * minute
    private static let day = 24 * hour
    private static let week = 7 * day
    private static let month = 4 * week
    private static let year = 12 * month
    
    private init() {}
    
    static func getUnitAndQuotient(from date: Date, as unit: TimeUnit? = nil) -> Interval {
        let seconds = Self.calculateSecondsAgo(from: date)
        let interval = Self.parseSeconds(value: seconds, to: unit)
        return interval
    }
    
    private static func calculateSecondsAgo(from date: Date) -> Int {
        let secondsAgo = Int(Date().timeIntervalSince(date))
        return secondsAgo
    }
    
    private static func parseSeconds(value seconds: Int, to timeUnit: TimeUnit?) -> Interval {
        guard let unit = timeUnit else {
            return Self.parseConveniently(fromSeconds: seconds)
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
    
    private static func parseConveniently(fromSeconds seconds: Int) -> Interval {
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
