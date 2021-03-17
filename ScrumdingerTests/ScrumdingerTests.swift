//
//  ScrumdingerTests.swift
//  ScrumdingerTests
//
//  Created by Abdalrahim Al Ayubi  on 15/12/2020.
//

import XCTest
import SwiftUI
@testable import Scrumdinger

class ScrumdingerTests: XCTestCase {
    
    var sut: ScrumdingerApp!
    @ObservedObject private var data = ScrumData()
    
    let scrum = DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, color: Color(#colorLiteral(red: 0.1607843137, green: 0.6117647059, blue: 0.6588235294, alpha: 1)))
    
    var daily = DailyScrum.Data()
    
    override func setUpWithError() throws {
        super.setUp()
        sut = ScrumdingerApp()
        self.data.scrums.append(scrum)
        self.data.save()
        self.performIfLoggedIn {
            print("closed")
        }
    }
    
    var isLoggedIn = true

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    private func performIfLoggedIn(closure: () -> Void) {
        print("isLoggedIn ", isLoggedIn)
        if isLoggedIn {
            closure()
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
