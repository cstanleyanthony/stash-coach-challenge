// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
@testable import StashCoach

struct MockAchievements {
    
    static let achievement1 = Achievement(level: 1)
    static let achievement2 = Achievement(level: 2)
    static let achievement3 = Achievement(level: 3)
    
    static let achievementsUnordered: [Achievement] = [
        achievement2,
        achievement3,
        achievement1
    ]
    
    static let achievementsOrdered: [Achievement] = [
        achievement1,
        achievement2,
        achievement3
    ]
    
}
