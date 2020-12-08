// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
import UIKit

class CoachRouter: CoachRoutable {
    
    static func buildModule() -> UIViewController {
        
        let view = CoachViewController()
        let router = CoachRouter()
        let presenter = CoachPresenter(view: view, router: router)
        let dataService = CoachRemoteDataService()
        let interactor = CoachInteractor(remoteDataService: dataService, presenter: presenter)
        
        view.presenter = presenter
        presenter.interactor = interactor
        dataService.remoteOutputManager = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
}
