// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
@testable import StashCoach

class MockInteractorOutputManager: CoachInteractorOutputable {
    
    var achievements: [Achievement]?
    var failureTrigggerd = false
    
    func achievements(achievements: [Achievement]) {
        self.achievements = achievements
    }
    
    func failedFetchingAchievements() {
        failureTrigggerd = true
    }
    
}
