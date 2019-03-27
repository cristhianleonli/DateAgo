//
//  ConversionTests.swift
//  DateAgoTests
//
//  Created by Cristhian Leon on 27.03.19.
//  Copyright © 2019 Cristhian León. All rights reserved.
//

import XCTest
import DateAgo

class ConversionTests: XCTestCase {
    
    let minute: TimeInterval = 60
    let hour: TimeInterval = 3_600
    let day: TimeInterval = 86_400
    let week: TimeInterval = 604_800
    let month: TimeInterval = 2_419_200
    
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
}
