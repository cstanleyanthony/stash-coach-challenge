// Created by Christian Sarcona on 12/7/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

class CoachStarterInteractor: CoachStarterInteractorInputable {
    
    weak var interactorOutput: CoachStarterInteractorOutputable?
    
    init(interactorOutput: CoachStarterInteractorOutputable? = nil) {
        self.interactorOutput = interactorOutput
    }
    
    func getAchievementsText() {
        interactorOutput?.gotAchievementText(DisplayText.achievementsText)
    }
    
}
