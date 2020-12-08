// Created by Christian Sarcona on 12/8/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class CustomizedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        customizeNav()
    }
    
    private func customizeNav() {
        
        setBackButton()
        setRightButton()
    }
    
    private func setBackButton() {
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    private func setRightButton() {
        let infoButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = infoButton
    }

}
