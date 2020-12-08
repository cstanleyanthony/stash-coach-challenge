// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
@testable import StashCoach

class MockRemoteDataServiceInput: CoachRemoteDataServiceInputable {
    
    weak var remoteOutputManager: CoachRemoteDataServiceOutputable?
    
    var testFailure = false
    var testDecodeFailure = false
    
    func fetchAchievements() {

        if testFailure {
            remoteOutputManager?.failureFetchingData()
        }
        else if testDecodeFailure {
            remoteOutputManager?.fetchedAchievements(data: Data())
        }
        else {
            remoteOutputManager?.fetchedAchievements(data: MockAchievements.jsonAchievements)
        }
    }
    
    func fetchData(fromUrl url: URL?, completion: FetchCompletion) {
        
    }
    
    func fetchImageResource(fromUrlString url: String, completion: FetchCompletion) {
        
    }
}
