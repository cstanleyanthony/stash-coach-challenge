// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
@testable import StashCoach

class MockRemoteDataServiceInput: CoachRemoteDataServiceInputable {
    
    weak var remoteDataServiceOutput: CoachRemoteDataServiceOutputable?
    
    var testFailure = false
    var testDecodeFailure = false
    
    func fetchAchievements() {

        if testFailure {
            remoteDataServiceOutput?.failureFetchingData()
        }
        else if testDecodeFailure {
            remoteDataServiceOutput?.fetchedData(data: Data())
        }
        else {
            remoteDataServiceOutput?.fetchedData(data: MockAchievements.jsonAchievements)
        }
    }
}
