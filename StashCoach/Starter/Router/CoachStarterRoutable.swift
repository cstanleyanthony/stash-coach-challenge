// Created by Christian Sarcona on 12/7/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
import UIKit

protocol CoachStarterRoutable {
    static func buildModule() -> UINavigationController
    func pushCoach(fromView view: CoachStarterPresenterOutputable?)
}
