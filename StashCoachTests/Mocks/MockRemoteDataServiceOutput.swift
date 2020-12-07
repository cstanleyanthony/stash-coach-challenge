// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	
import Foundation
@testable import StashCoach

class MockRemoteDataServiceOutput: CoachRemoteDataServiceOutputable {
    
    var remoteData: Data?
    var receivedFailure = false
    
    func failureFetchingData() {
        receivedFailure = true
    }
    
    func fetchedData(data: Data) {
        self.remoteData = data
    }
    
}
