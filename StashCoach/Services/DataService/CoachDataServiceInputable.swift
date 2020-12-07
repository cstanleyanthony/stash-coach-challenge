// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

typealias FetchCompletion = ((Data)->Void)?

/// A protocol to be used by either remote or local data services.
/// Allows the interactor to request data from the data service.
protocol CoachDataServiceInputable {
    func fetchAchievements()
}
