// Created by Christian Sarcona on 12/7/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
@testable import StashCoach

class MockInteractorInput: CoachInteractorInputable {
    
    var remoteDataService: CoachRemoteDataServiceInputable?
    
    var localDataService: CoachLocalDataServiceInputable?
    
    weak var presenter: CoachInteractorOutputable?
    
    let achievements = MockAchievements.achievementsOrdered
    
    init(presenter: CoachInteractorOutputable? = nil) {
        self.presenter = presenter
    }
    
    func fetchAchievements() {
        
    }
    
    func getAllAchievements() -> [Achievement] {
        return achievements
    }
    
    func achievementsCount() -> Int {
        return achievements.count
    }
    
    func achievement(forIndex index: Int) -> Achievement? {
        return achievements[index]
    }
    
    func fetchImge(atIndex index: Int) {
        
    }
    
    func getImageData(atIndex index: Int) -> Data? {
        return nil
    }
    
    func fetchTitle() -> String? {
        return "Smart Investing"
    }
    
    
}
