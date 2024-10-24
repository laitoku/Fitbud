//
//  FitbudTests.swift
//  FitbudTests
//
//  Created by Joshua Lai on 10/15/24.
//

import XCTest
@testable import Fitbud

final class FitbudTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testScheduled() throws {
        let result = Scheduled(date: Date(timeIntervalSince1970: 1729633731))
        let result2 = Scheduled(date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 23))!)
        
        XCTAssertTrue(result.isEmpty, "There are no workouts today.")
        XCTAssertFalse(result2.isEmpty, "There is a workout today.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
