// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

/// A protocol to be used by either remote or local data services.
protocol CoachDataServiceProtocol {
    func fetchAchievements()
}
