// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	
import XCTest
@testable import StashCoach

class CoachInteractorTests: XCTestCase {
    
    var interactor: (CoachInteractorInputProtocol & CoachRemoteDataServiceOutputProtocol)?
    let mockRemoteDataServiceInput = MockRemoteDataServiceInput()
    let mockInteractorOutputManager = MockInteractorOutputManager()

    override func setUpWithError() throws {
        interactor = CoachInteractor(remoteDataService: mockRemoteDataServiceInput,
                                     interactorOutputManager: mockInteractorOutputManager)
        mockRemoteDataServiceInput.remoteDataServiceOutput = interactor
    }

    override func tearDownWithError() throws {
        
    }

    func testInteractorFetchesAchievements() throws {
        
        interactor?.fetchAchievements()
        
        XCTAssertNotNil(mockInteractorOutputManager.achievements, "Achievements should not be nil.")
        XCTAssertEqual(mockInteractorOutputManager.achievements, MockAchievements.achievementsUnordered, "Achievements should equal an array of unordered achievements.")
    }
    
    func testFailedFetchingAcievements() throws {
        mockRemoteDataServiceInput.testFailure = true
        interactor?.fetchAchievements()
        
        XCTAssertTrue(mockInteractorOutputManager.failureTrigggerd, "When receiving a failure from the data service the interactor should send a failure back to the output.")
    }
    
    func testFailedDecodingFetchedAchievements() throws {
        mockRemoteDataServiceInput.testDecodeFailure = true
        interactor?.fetchAchievements()
        
        XCTAssertTrue(mockInteractorOutputManager.failureTrigggerd, "When failing to decode received data a failure should be passed back to the output.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
