// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

/// A protocol to be used for sending data back from the remote data service.
protocol CoachRemoteDataServiceOutputable: CoachDataServiceOutputable {
    var interactorOutputManager: CoachInteractorOutputable? { get set }
    func fetchedAchievements(data: Data)
    func fetchedImage(data: Data)
    
}

