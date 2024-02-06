import XCTest
import DateAgo

final class ConversionTests: XCTestCase {
    
    private let minute: TimeInterval = 60
    private let hour: TimeInterval = 3_600
    private let day: TimeInterval = 86_400
    private let week: TimeInterval = 604_800
    private let month: TimeInterval = 2_419_200
    private let year: TimeInterval = 29_030_400
    
    func test_TimeAgo_TwoSecondsAgo() {
        let time = Date(timeIntervalSinceNow: -2)
        let interval = time.timeAgo()
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .second)
    }
    
    func test_TimeAgo_TwoMinutesAgo() {
        let time = Date(timeIntervalSinceNow: -minute * 2)
        let interval = time.timeAgo()
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .minute)
    }
    
    func test_TimeAgo_TwoHoursAgo() {
        let time = Date(timeIntervalSinceNow: -hour * 2)
        let interval = time.timeAgo()
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .hour)
    }
    
    func test_TimeAgo_TwoDaysAgo() {
        let time = Date(timeIntervalSinceNow: -day * 2)
        let interval = time.timeAgo()
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .day)
    }
    
    func test_TimeAgo_TwoWeeksAgo() {
        let time = Date(timeIntervalSinceNow: -week * 2)
        let interval = time.timeAgo()
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .week)
    }
    
    func test_TimeAgo_TwoMonthsAgo() {
        let time = Date(timeIntervalSinceNow: -month * 2)
        let interval = time.timeAgo()
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .month)
    }
    
    func test_TimeAgo_TwoYearsAgo() {
        let time = Date(timeIntervalSinceNow: -year * 2)
        let interval = time.timeAgo()
        
        XCTAssertEqual(interval.value, 2)
        XCTAssertEqual(interval.unit, .year)
    }
    
    func test_TimeAgo_SixtySeconds() {
        let time = Date(timeIntervalSinceNow: -60)
        let interval = time.timeAgo()
        
        XCTAssertEqual(interval.value, 1)
        XCTAssertEqual(interval.unit, .minute)
    }
}
