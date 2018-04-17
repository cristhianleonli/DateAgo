//
//  DateAgoTests.swift
//  DateAgoTests
//
//  Created by Cristhian León on 9/19/18.
//  Copyright © 2018 Cristhian León. All rights reserved.
//

import XCTest
@testable import DateAgo

class DateAgoTests: XCTestCase {
    
    var english = TimeLanguage.english
    
    var spanish = TimeLanguage.spanish
    
    func test_formatTimeString_AllParameters() {
        // given
        let time = 10
        
        // when
        let formattedString = Date().formatTimeString(timeAgo: english.timeAgoText,
                                                      quotient: time, unit: english.day)
        // then
        XCTAssertEqual(formattedString, "\(time) \(english.day.plural) \(english.timeAgoText.text!)")
    }
    
    func test_formatTimeString_PositionPre() {
        // given
        let time = 10
        
        // when
        let formattedString = Date().formatTimeString(timeAgo: spanish.timeAgoText,
                                                      quotient: time, unit: spanish.day)
        // then
        XCTAssertEqual(formattedString, "\(spanish.timeAgoText.text!) \(time) \(spanish.day.plural)")
    }
    
    func test_formatTimeString_TimeZero() {
        // when
        let formattedString = Date().formatTimeString(timeAgo: english.timeAgoText,
                                                      quotient: 0, unit: english.day)
        // then
        XCTAssertEqual(formattedString, english.timeAgoText.momentAgoText)
    }
    
    func test_formatTimeString_TimeZero_MomentAgoNil() {
        // given
        let time = 10
        english.timeAgoText.momentAgoText = nil
        
        // when
        let formattedString = Date().formatTimeString(timeAgo: english.timeAgoText,
                                                      quotient: time, unit: english.day)
        // then
        XCTAssertEqual(formattedString, "\(time) \(english.day.plural) \(english.timeAgoText.text!)")
    }
    
    func test_formatTimeString_TimeZero_TextNil_MomentAgoNil() {
        // given
        let time = 10
        english.timeAgoText.momentAgoText = nil
        english.timeAgoText.text = nil
        
        // when
        let formattedString = Date().formatTimeString(timeAgo: english.timeAgoText,
                                                      quotient: time, unit: english.day)
        // then
        XCTAssertEqual(formattedString, "\(time) \(english.day.plural)")
    }
    
    func test_GetUnitAndQuotient_JustNow() {
        let (quotient, unit) = Date().getUnitAndQuotient(units: english.getUnits())
        XCTAssertEqual(quotient, 0)
        XCTAssertEqual(unit, english.second)
    }
    
    func test_GetUnitAndQuotient_TwoMinutesAgo() {
        let twoMinutesAgo = Date(timeIntervalSinceNow: -60 * 2)
        let (quotient, unit) = twoMinutesAgo.getUnitAndQuotient(units: english.getUnits())
        XCTAssertEqual(quotient, 2)
        XCTAssertEqual(unit, english.minute)
    }
    
    func test_GetUnitAndQuotient_TwoHoursAgo() {
        let twoHoursAgo = Date(timeIntervalSinceNow: -60 * 60 * 2)
        let (quotient, unit) = twoHoursAgo.getUnitAndQuotient(units: english.getUnits())
        XCTAssertEqual(quotient, 2)
        XCTAssertEqual(unit, english.hour)
    }
    
    func test_GetUnitAndQuotient_TwoDaysAgo() {
        let twoDaysAgo = Date(timeIntervalSinceNow: -60 * 60 * 24 * 2)
        let (quotient, unit) = twoDaysAgo.getUnitAndQuotient(units: english.getUnits())
        XCTAssertEqual(quotient, 2)
        XCTAssertEqual(unit, english.day)
    }
    
    func test_GetUnitAndQuotient_TwoWeeksAgo() {
        let twoWeeksAgo = Date(timeIntervalSinceNow: -60 * 60 * 24 * 7 * 2)
        let (quotient, unit) = twoWeeksAgo.getUnitAndQuotient(units: english.getUnits())
        XCTAssertEqual(quotient, 2)
        XCTAssertEqual(unit, english.week)
    }
    
    func test_GetUnitAndQuotient_TwoMonthsAgo() {
        let twoMonthsAgo = Date(timeIntervalSinceNow: -60 * 60 * 24 * 7 * 4 * 2)
        let (quotient, unit) = twoMonthsAgo.getUnitAndQuotient(units: english.getUnits())
        XCTAssertEqual(quotient, 2)
        XCTAssertEqual(unit, english.month)
    }
}
