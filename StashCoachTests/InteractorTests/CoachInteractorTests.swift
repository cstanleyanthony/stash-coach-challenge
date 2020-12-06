// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	
import XCTest
@testable import StashCoach

class CoachInteractorTests: XCTestCase {
    
    var interactor: CoachInteractorInputProtocol?

    override func setUpWithError() throws {
        interactor = CoachInteractor(remoteDataService: MockRemoteDataServiceInput())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInteractorFetchesAchievements() throws {
        
        let achievements = interactor?.fetchAchievements()
        
        XCTAssertEqual(achievements, [Achievement](), "Achievements should equal an array of achievements.")
    }
    
    func testInteractorOrdersAchievementsByLevelsAscedning() throws {
        
        let achievements = interactor?.fetchAchievements()
        
        XCTAssertEqual(achievements, MockAchievements.achievementsOrdered, "Achievements should be ordered by level in ascending order.")
    }
    
    func testAchievementHasId() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
