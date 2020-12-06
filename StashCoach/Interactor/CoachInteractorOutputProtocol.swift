// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

protocol CoachInteractorOutputProtocol: class {
    
    func achievements(achievements: [Achievement])
    func failedFetchingAchievements()
}
