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
    
//    func testScheduled() throws {
//        let result = Scheduled(date: Date(timeIntervalSince1970: 1729633731))
//        let result2 = Scheduled(date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 23))!)
//        
//        XCTAssertTrue(result.isEmpty, "There are no workouts today.")
//        XCTAssertFalse(result2.isEmpty, "There is a workout today.")
//    }
    
    func testDBUpdate() throws {
        // Run the update
        let d = DatabaseHelper()
        let db = d.openDatabase()
        d.updateTotal(forTitle: "Push Ups", newTotal: 0, db: db!)
        
        // Verify the update
        if let updatedRow = d.retrieveRow(byID: 1, db: db!) {
            XCTAssertEqual(updatedRow["total"] as! Int, 0, "The total value was not updated correctly.")
        } else {
            XCTFail("Failed to retrieve updated data.")
        }
        d.closeDatabase(db)
    }
    
    func testRetrieveRow() throws {
        let d = DatabaseHelper()
        let db = d.openDatabase()
        
        if let r = d.retrieveRow(byID: 1, db: db!) {
            XCTAssertNotNil(r, "Retrieved row data \(r)")
        } else {
            XCTFail("Failed to retrieve row data.")
        }
        d.closeDatabase(db)
    }
    
    func testRetrieveMetrics() throws {
        let d = DatabaseHelper()
        let r = d.retrieveMetrics()
        
        XCTAssertNotNil(r, "Metrics Retreived: \(r)")
    }
    
    func testgenSchedule() throws {
        genSchedule(date: Date())
        if let result = UserDefaults.standard.data(forKey: "schedule") {
            XCTAssertNotNil(result, "Schedule generated.")
        } else {
            XCTFail("Failed to generate schedule.")
        }
    }
    
    func testdecodeSchedule() throws {
        let result = decodeSchedule()
        XCTAssertNotNil(result, "Result: \(result)")
    }
    
    func testScheduled() {
        let result = Scheduled(date: Date())
        
        XCTAssertNotNil(result, "Current day schedule: \(result)")
    }
    
    func testSkip() throws {
        SkipDay()
        let result = UserDefaults.standard.data(forKey: "schedule")
        print(result as Any)
    }
    
    func testSkipMissingDays() throws {
        SkipMissingDays()
        let result = UserDefaults.standard.data(forKey: "schedule")
        print(result as Any)
    }
    
    func testUpdateMetrics() {
        UpdateMetrics()
        let d = UserDefaults.standard
        
        print(d.data(forKey: "schedule") as Any)
        print(d.integer(forKey: "streak"))
        print(d.integer(forKey: "completedDays"))
        print(d.integer(forKey: "missedDays"))
        print(d.bool(forKey: "dayComplete"))
        print(d.object(forKey: "day") as Any)
    }
    
    func testNotification() throws {
        var dateComponents = DateComponents()
        dateComponents.hour = Calendar.current.component(.hour, from: Date())
        dateComponents.minute = Calendar.current.component(.minute, from: Date())
        dateComponents.second = Calendar.current.component(.second, from: Date()) + 10
        createCalendarNotification(title: "Come Back!", body: "You missed the last session, please come back!", dateComponents: dateComponents, identifier: "missingReminder1")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
