// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	
import Foundation
import XCTest
@testable import StashCoach

class MockRemoteDataServiceOutput: CoachRemoteDataServiceOutputable {
    
    weak var interactorOutputManager: CoachInteractorOutputable?
    
    var remoteData: Data?
    var receivedFailure = false
    var expectation: XCTestExpectation?
    
    func failureFetchingData() {
        receivedFailure = true
    }
    
    func fetchedData(data: Data) {
        expectation?.fulfill()
        remoteData = data
    }
    
    func fetchedAchievements(data: Data) {
        expectation?.fulfill()
        remoteData = data
    }
    
    func fetchedImage(data: Data) {
        expectation?.fulfill()
        remoteData = data
    }
    
}
