// Created by Christian Sarcona on 12/8/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class CoachNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNav()
    }
    
    private func setupNav() {
        
        setTint()
        setTitleColor()
    }
    
    private func setTint() {
        navigationBar.tintColor = UIColor.white
        navigationBar.barTintColor = Constants.Colors.navigationPurple.color()
        navigationBar.isTranslucent = false
    }
    
    private func setTitleColor() {
        UINavigationBar.appearance().titleTextAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
