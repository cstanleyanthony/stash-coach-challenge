// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	
import Foundation
@testable import StashCoach

class MockRemoteDataServiceOutput: CoachRemoteDataServiceOutputProtocol {
    
    var remoteData: Data?
    var receivedFailure = false
    
    func failureFetchingRemoteData() {
        receivedFailure = true
    }
    
    func fetchedRemoteData(data: Data) {
        self.remoteData = data
    }
    
}
