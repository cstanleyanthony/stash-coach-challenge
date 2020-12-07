// Created by Christian Sarcona on 12/4/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

class CoachInteractor: CoachInteractorInputable, CoachRemoteDataServiceOutputable {
    
    let remoteDataService: CoachRemoteDataServiceInputable
    
    weak var interactorOutputManager: CoachInteractorOutputable?
    
    init(remoteDataService: CoachRemoteDataServiceInputable,
         interactorOutputManager: CoachInteractorOutputable? = nil) {
        
        self.remoteDataService = remoteDataService
        self.interactorOutputManager = interactorOutputManager
    }
    
    func fetchAchievements() {
        remoteDataService.fetchAchievements()
    }
    
    func failureFetchingData() {
        interactorOutputManager?.failedFetchingAchievements()
    }
    
    func fetchedData(data: Data) {
        do {
            let achievements = try JSONDecoder().decode(Achievements.self, from: data)
            interactorOutputManager?.achievements(achievements: achievements.achievements)
        }
        catch let err {
            LoggerService.log(category: "Interactor fetched data decode", message: "Failed to decode data:", value: err.localizedDescription)
            interactorOutputManager?.failedFetchingAchievements()
        }
    }
}
