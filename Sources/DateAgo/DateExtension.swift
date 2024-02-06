import Foundation

public extension Date {
    func timeAgo(as unit: TimeUnit) -> Interval {
        return DateParser.getUnitAndQuotient(from: self, as: unit)
    }
    
    func timeAgo() -> Interval {
        return DateParser.getUnitAndQuotient(from: self)
    }
}
