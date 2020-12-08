// Created by Christian Sarcona on 12/8/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

extension UIView {
    func buildConstraints(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach { $0.isActive = true }
    }
}
