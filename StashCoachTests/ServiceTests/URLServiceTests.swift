// Created by Christian Sarcona on 12/6/20 for Stash
// Stash Coach challenge
// 
	

import XCTest
@testable import StashCoach

class URLServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        
    }

    func testUrlCreatesCorrectUrl() throws {
        let url = URLService.achievements.url?.absoluteString
        
        XCTAssertEqual(url, "https://server.stash.com/achievements")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
