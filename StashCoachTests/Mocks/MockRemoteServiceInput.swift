// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
@testable import StashCoach

class MockRemoteDataServiceInput: CoachRemoteDataServiceInputProtocol {
    
    weak var remoteDataServiceOutput: CoachRemoteDataServiceOutputProtocol?
    
    func fetchAchievements() {

        guard let jsonData = MockAchievements.jsonAchievements
        else {
            remoteDataServiceOutput?.failureFetchingData()
            return
        }
        remoteDataServiceOutput?.fetchedData(data: jsonData)
    }
}
