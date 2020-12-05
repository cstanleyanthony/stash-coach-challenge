// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

class CoachInteractor: CoachInteractorProtocol {
    
    let remoteDataService: CoachRemoteDataServiceInputProtocol
    
    init(remoteDataService: CoachRemoteDataServiceInputProtocol) {
        self.remoteDataService = remoteDataService
    }
    
    func fetchAchievements() -> [Achievement] {
        return []
    }
}
