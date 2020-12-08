// Created by Christian Sarcona on 12/7/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

class CoachStarterPresenter: CoachStarterPresenterInputable, CoachStarterInteractorOutputable {
    
    weak var presenterOutput: CoachStarterPresenterOutputable?
    var router: CoachStarterRoutable?
    var interactorInput: CoachStarterInteractorInputable?
    
    init(router: CoachStarterRoutable? = nil,
         presenterOutput: CoachStarterPresenterOutputable? = nil,
         interactorInput: CoachStarterInteractorInputable? = nil) {
        self.router = router
        self.presenterOutput = presenterOutput
        self.interactorInput = interactorInput
    }
    
    func getAchievementText() {
        interactorInput?.getAchievementsText()
    }
    
    func gotAchievementText(_ text: String) {
        presenterOutput?.gotAchievementText(text)
    }
    
    func showCoach() {
        router?.pushCoach(fromView: presenterOutput)
    }
    
}
