// Created by Christian Sarcona on 12/7/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
import UIKit

class CoachStarterRouter: CoachStarterRoutable {
    
    static func buildModule() -> UINavigationController {
        let starterVC = StarterViewController()
        let starterRouter = CoachStarterRouter()
        let starterPresenter = CoachStarterPresenter(router: starterRouter, presenterOutput: starterVC)
        let starterInteractor = CoachStarterInteractor(interactorOutput: starterPresenter)
        
        starterVC.presenter = starterPresenter
        starterPresenter.interactorInput = starterInteractor
        
        let navController = UINavigationController(rootViewController: starterVC)
        
        return navController
        
    }
    
    func pushCoach(fromView view: CoachStarterPresenterOutputable?) {
        let coachVC = CoachRouter.buildModule()
        
        if let vc = view as? UIViewController,
            let sourceNav = vc.navigationController {
            sourceNav.pushViewController(coachVC, animated: true)
        }
    }
}
