//
//  ViewController.swift
//  StashCoach
//
//  Created by Christian Sarcona on 12/3/20.
//

import UIKit

class StarterViewController: UIViewController, CoachStarterPresenterOutputable {
    
    var presenter: CoachStarterPresenterInputable?
    
    let achievementsButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        presenter?.showCoach()
    }

    private func setupButton() {
        achievementsButton.translatesAutoresizingMaskIntoConstraints = false
        achievementsButton.backgroundColor = .purple
        achievementsButton.layer.cornerRadius = 8
        presenter?.getAchievementText()
        view.addSubview(achievementsButton)
        setButtonConstraints()
    }
    
    private func setButtonConstraints() {
        [
            achievementsButton.widthAnchor.constraint(equalToConstant: 200),
            achievementsButton.heightAnchor.constraint(equalToConstant: 100.0),
            achievementsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            achievementsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ].forEach { $0.isActive = true }
    }
    
    func gotAchievementText(_ text: String) {
        achievementsButton.setTitle(text, for: .normal)
    }

}

