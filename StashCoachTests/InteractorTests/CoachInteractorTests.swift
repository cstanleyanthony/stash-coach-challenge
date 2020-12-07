// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	
import XCTest
@testable import StashCoach

class CoachInteractorTests: XCTestCase {
    
    var interactor: (CoachInteractorInputable & CoachRemoteDataServiceOutputable)?
    let mockRemoteDataServiceInput = MockRemoteDataServiceInput()
    let mockInteractorOutputManager = MockInteractorOutputManager()

    override func setUpWithError() throws {
        interactor = CoachInteractor(remoteDataService: mockRemoteDataServiceInput,
                                     interactorOutputManager: mockInteractorOutputManager)
        mockRemoteDataServiceInput.remoteOutputManager = interactor
        mockInteractorOutputManager.interactorInput = interactor
    }

    override func tearDownWithError() throws {
        
    }

    func testInteractorFetchesAchievementsAndSortsByLevel() throws {
        
        interactor?.fetchAchievements()
        
        XCTAssertNotNil(mockInteractorOutputManager.achievements, "Achievements should not be nil.")
        XCTAssertEqual(mockInteractorOutputManager.achievements, MockAchievements.achievementsOrdered, "Achievements should equal an array of unordered achievements.")
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
    
    func testGetsCorrectAchievementCount() throws {
        
        interactor?.fetchAchievements()
        let count = interactor?.achievementsCount()
        
        XCTAssertEqual(count, 3, "Achievements count should equal 3.")
    }
    
    func testGetsCorrectAchievementForIndex() throws {
        
        interactor?.fetchAchievements()
        let index = 2
        let achievement = interactor?.achievement(forIndex: index)
        
        XCTAssertEqual(achievement, MockAchievements.achievementsOrdered[index], "Returned achievement should equal the achievement at the index.")
    }
    
    func testOutOfBoundsIndexForAchievementReturnNil() throws {
        
        interactor?.fetchAchievements()
        
        var index = -1
        
        var achievement = interactor?.achievement(forIndex: index)
        XCTAssertNil(achievement, "Achievement should be nil if index is less than 0.")
        
        index = 100
        achievement = interactor?.achievement(forIndex: index)
        XCTAssertNil(achievement, "Achievement should be nil if index is out of bounds.")
    }
    
    func testPresenterOrdersAchievementsByLevelsAscedning() throws {
        
//        interactor?.fetchAchievements()
//
//        XCTAssertEqual(mockInteractorOutputManager.achievements, MockAchievements.achievementsOrdered, "Achievements should be ordered by level in ascending order.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
