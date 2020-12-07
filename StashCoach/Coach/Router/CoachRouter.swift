// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
import UIKit

class CoachRouter: CoachRoutable {
    
    static func buildModule() -> UIViewController {
        
        let view = CoachViewController()
        let router = CoachRouter()
        let presenter = CoachPresenter(presenterOutput: view, router: router)
        let dataService = CoachRemoteDataService()
        let interactor = CoachInteractor(remoteDataService: dataService, interactorOutputManager: presenter)
        
        view.presenter = presenter
        presenter.interactorInput = interactor
        dataService.remoteOutputManager = interactor
        interactor.interactorOutputManager = presenter
        
        return view
        
    }
    
}
