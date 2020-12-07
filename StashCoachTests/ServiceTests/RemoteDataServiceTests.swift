// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import XCTest
@testable import StashCoach

class RemoteDataServiceTests: XCTestCase {
    
    var remoteDataService: CoachRemoteDataServiceInputable?
    let mockRemoteServiceOutput = MockRemoteDataServiceOutput()

    override func setUpWithError() throws {
        
        remoteDataService = CoachRemoteDataService(remoteOutputManager: mockRemoteServiceOutput)

    }

    override func tearDownWithError() throws {
        
    }
    
    #if DEBUG
    /// Tests fetching local JSON when configuration is set to DEBUG
    /// To test the DEBUG configuration, in 'Edit Scheme' under "Test' action, set the 'Build Configuration' to 'DEBUG'.
    func testFetchingLocalJSON() throws {
        remoteDataService?.fetchAchievements()
        XCTAssertNotNil(mockRemoteServiceOutput.remoteData)
        XCTAssertFalse(mockRemoteServiceOutput.receivedFailure)
    }
    
    func testFetchingLocalJSONFetchesCorrectData() throws {
        remoteDataService?.fetchAchievements()
        XCTAssertEqual(mockRemoteServiceOutput.remoteData, MockAchievements.jsonAcievementsFile, "Fetching local JSON should fetch correct data.")
    }
    #else
    /// Tests fetching remote JSON when configuration is set to something other than DEBUG
    /// To test the RELEASE configuration, in 'Edit Scheme' under 'Test' action, set the 'Build Configuration' to 'RELEASE TEST'. This is a duplicate of the RELEASE configuration, but with the 'ENABLE TESTABILITY' Build Option set to 'YES'.
    func testFetchingRemoteJSON() throws {
        remoteDataService?.fetchAchievements()
        XCTAssertNotNil(mockRemoteServiceOutput.remoteData)
        XCTAssertFalse(mockRemoteServiceOutput.receivedFailure)
    }
    #endif

    func testPerformanceExample() throws {
        self.measure {
            
        }
    }

}
