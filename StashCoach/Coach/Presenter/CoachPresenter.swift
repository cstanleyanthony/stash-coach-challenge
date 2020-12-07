// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

class CoachPresenter: CoachPresenterInputable, CoachInteractorOutputable {
    
    weak var presenterOutput: CoachPresenterOutputable?
    var router: CoachRoutable?
    var interactorInput: CoachInteractorInputable?
    
    init(presenterOutput: CoachPresenterOutputable? = nil, router: CoachRoutable? = nil, interactorInput: CoachInteractorInputable? = nil) {
        self.presenterOutput = presenterOutput
        self.router = router
        self.interactorInput = interactorInput
    }
    
    func achievements(achievements: [Achievement]) {
        
    }
    
    func failedFetchingAchievements() {
        
    }
}
