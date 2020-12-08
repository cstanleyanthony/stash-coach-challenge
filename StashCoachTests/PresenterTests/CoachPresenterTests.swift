// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	
import XCTest
@testable import StashCoach

class CoachPresenterTests: XCTestCase {
    
    var presenter: (CoachPresenterInputable & CoachInteractorOutputable)?
    let mockOutput = MockCoachPresenterOutput()
    let mockInput = MockInteractorInput()

    override func setUpWithError() throws {
        
        presenter = CoachPresenter(view: mockOutput, interactor: mockInput)
        mockInput.presenter = presenter
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPresenterGetsCorrectItemCount() throws {
        
        let itemCount = presenter?.getItemCount()
        
        XCTAssertEqual(itemCount, 3, "Item count should equal 3.")
        
    }
    
    func testPresenterGetsCorrectItem() throws {
        
        let index = 1
        let item = presenter?.getItem(atIndex: index)
        
        XCTAssertEqual(item, MockAchievements.achievementsOrdered[index], "The returned item should equal the achievement at the index.")
    }
    
    func testPresenterGetsCorrectLevelForAchievement() throws {
        
        let index = 1
        let level = presenter?.getLevel(atIndex: index)
        
        XCTAssertEqual(level, MockAchievements.achievementsOrdered[index].level, "The returned level should be equal to the level of the achievement at the index.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
