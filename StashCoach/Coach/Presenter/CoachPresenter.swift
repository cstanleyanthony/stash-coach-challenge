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
    
    func viewDidLoad() {
        interactorInput?.fetchAchievements()
    }
    
    func fetchedAchievements() {
        presenterOutput?.displayAchievements()
    }
    
    func failedFetchingAchievements() {
        
    }
    
    func getItemCount() -> Int {
        interactorInput?.achievementsCount() ?? 0
    }
    
    func getItem(atIndex index: Int) -> Achievement? {
        interactorInput?.achievement(forIndex: index)
    }
    
    func getImage(atIndex index: Int) {
        interactorInput?.fetchImge(atIndex: index)
    }
    
    func getLevel(atIndex index: Int) -> String? {
        getItem(atIndex: index)?.level
    }
    
    func getImageData(atIndex index: Int) -> Data? {
        return interactorInput?.getImageData(atIndex: index)
    }
}
