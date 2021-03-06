import Foundation

extension Date {
    func timeAgo(as unit: Interval.TimeUnit) -> Interval {
        return DateCalculator.getUnitAndQuotient(from: self, as: unit)
    }
    
    func timeAgo() -> Interval {
        return DateCalculator.getUnitAndQuotient(from: self)
    }
}

struct Interval: CustomStringConvertible {
    var value: Int
    var unit: TimeUnit
    
    var description: String {
        return "Interval(value: \(value), unit: \(unit))"
    }
    
    enum TimeUnit {
        case second
        case minute
        case hour
        case day
        case week
        case month
        case year
    }
    
    init() {
        self.value = 0
        self.unit = .second
    }
    
    init(value: Int, unit: TimeUnit) {
        self.value = value
        self.unit = unit
    }
}

struct DateCalculator {
    
    private let minute = 60
    private let hour = 3_600
    private let day = 86_400
    private let week = 604_800
    private let month = 2_419_200
    private let year = 29_030_400
    
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
    
    private func calculateSecondsAgo(from date: Date) -> Int {
        let secondsAgo = Int(Date().timeIntervalSince(date))
        return secondsAgo
    }
    
    private func parseSeconds(value seconds: Int, to timeUnit: Interval.TimeUnit?) -> Interval {
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
    
    private func parseConveniently(fromSeconds seconds: Int) -> Interval {
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