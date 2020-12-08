// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
@testable import StashCoach

class MockPresenter: CoachInteractorOutputable {
    
    weak var view: CoachPresenterOutputable?
    var interactor: CoachInteractorInputable?

    var achievements: [Achievement]?
    
    var failureTrigggerd = false
    
    func fetchedAchievements() {
        achievements = interactor?.getAllAchievements()
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
