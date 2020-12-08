// Created by Christian Sarcona on 12/7/20 for Stash
// Stash Coach challenge
// 
	

import Foundation

protocol CoachPresenterOutputable: class {
    
    var presenter: CoachPresenterInputable? { get set }
    func displayAchievements()
}
