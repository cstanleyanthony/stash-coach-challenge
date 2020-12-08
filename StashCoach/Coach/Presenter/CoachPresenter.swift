// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
import CoreGraphics

class CoachPresenter: CoachPresenterInputable, CoachInteractorOutputable {

    weak var view: CoachPresenterOutputable?
    var router: CoachRoutable?
    var interactor: CoachInteractorInputable?
    
    init(view: CoachPresenterOutputable? = nil, router: CoachRoutable? = nil, interactor: CoachInteractorInputable? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor?.fetchAchievements()
    }
    
    func fetchedAchievements() {
        view?.displayAchievements()
    }
    
    func failedFetchingAchievements() {
        view?.displayFailureAlert()
    }
    
    func getItemCount() -> Int {
        interactor?.achievementsCount() ?? 0
    }
    
    func getItem(atIndex index: Int) -> Achievement? {
        interactor?.achievement(forIndex: index)
    }
    
    func getImage(atIndex index: Int) {
        interactor?.fetchImge(atIndex: index)
    }
    
    func getLevel(atIndex index: Int) -> String? {
        getItem(atIndex: index)?.level
    }
    
    func getProgressPoints(atIndex index: Int) -> String? {
        if let item = getItem(atIndex: index) {
            return "\(item.progress)" + "pts"
        }
        return nil
    }
    
    func getTotalPoints(atIndex index: Int) -> String? {
        if let item = getItem(atIndex: index) {
            return "\(item.total)" + "pts"
        }
        return nil
    }
    
    func getProgress(atIndex index: Int) -> Double? {
        if let item = getItem(atIndex: index) {
            return Double(item.progress) / Double(item.total)
        }
        return nil
    }
    
    func getImageData(atIndex index: Int) -> Data? {
        return interactor?.getImageData(atIndex: index)
    }
    
    func getAccessible(atIndex index: Int) -> Bool? {
        getItem(atIndex: index)?.accessible
    }
    
    func getTitle() -> String? {
        return interactor?.fetchTitle()
    }
}
