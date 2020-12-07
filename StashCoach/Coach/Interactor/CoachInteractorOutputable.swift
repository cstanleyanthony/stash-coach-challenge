// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

protocol CoachInteractorOutputable: class {
    var presenterOutput: CoachPresenterOutputable? { get set }
    func fetchedAchievements()
    func failedFetchingAchievements()
    
}
