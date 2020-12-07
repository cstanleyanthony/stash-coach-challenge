// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
@testable import StashCoach

class MockInteractorOutputManager: CoachInteractorOutputable {
    
    weak var presenterOutput: CoachPresenterOutputable?
    var interactorInput: CoachInteractorInputable?

    var achievements: [Achievement]?
    var failureTrigggerd = false
    
    func fetchedAchievements() {
        achievements = interactorInput?.getAllAchievements()
    }
    
    func achievements(achievements: [Achievement]) {
        self.achievements = achievements
    }
    
    func failedFetchingAchievements() {
        failureTrigggerd = true
    }
    
    func receivedImage(imageData data: Data) {
        
    }
    
}
