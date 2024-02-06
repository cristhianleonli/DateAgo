import XCTest
import DateAgo

final class DateAgoTests: XCTestCase {
    
    private let minute: TimeInterval = 60
    private let hour: TimeInterval = 3_600
    private let day: TimeInterval = 86_400
    private let week: TimeInterval = 604_800
    private let month: TimeInterval = 2_419_200
    private let year: TimeInterval = 29_030_400
    
    func test_GetUnitAndQuotient_TwoMinutesAgo() {
        let time = Date(timeIntervalSinceNow: -minute * 2)
        let interval = time.timeAgo(as: .minute)
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .minute)
    }
    
    func test_GetUnitAndQuotient_TwoHoursAgo() {
        let time = Date(timeIntervalSinceNow: -hour * 2)
        let interval = time.timeAgo(as: .hour)
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .hour)
    }

    func test_GetUnitAndQuotient_TwoDaysAgo() {
        let time = Date(timeIntervalSinceNow: -day * 2)
        let interval = time.timeAgo(as: .day)
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .day)
    }

    func test_GetUnitAndQuotient_TwoWeeksAgo() {
        let time = Date(timeIntervalSinceNow: -week * 2)
        let interval = time.timeAgo(as: .week)
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .week)
    }

    func test_GetUnitAndQuotient_TwoMonthsAgo() {
        let time = Date(timeIntervalSinceNow: -month * 2)
        let interval = time.timeAgo(as: .month)
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .month)
    }
    
    func test_GetUnitAndQuotient_TwoYearsAgo() {
        let time = Date(timeIntervalSinceNow: -year * 2)
        let interval = time.timeAgo(as: .year)
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .year)
    }
}
