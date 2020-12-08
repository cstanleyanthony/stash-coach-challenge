// Created by Christian Sarcona on 12/7/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class LevelView: UIView {
    
    private let level: String
    private let circleLayer = CAShapeLayer()
    private let titleLabel = UILabel()
    private let levelLabel = UILabel()
    
    init(frame: CGRect = CGRect.zero, level: String) {
        self.level = level
        super.init(frame: frame)
        
        backgroundColor = .clear
        clipsToBounds = false
        
        addText(level: level)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(ovalIn: rect)

        circleLayer.path = circlePath.cgPath

        circleLayer.fillColor = UIColor.white.cgColor
        circleLayer.strokeColor = UIColor.white.cgColor
        circleLayer.opacity = 0.9
        
    }
    
    private func addText(level: String) {
        
        addTitleLabel()
        addLevelLabel()
        
        layer.insertSublayer(circleLayer, below: titleLabel.layer)
    }
    
    private func addTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Level"
        titleLabel.textAlignment = .center
        titleLabel.font = titleLabel.font.withSize(18)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        addSubview(titleLabel)
        addTitleLabelConstraints(forView: titleLabel)
    }
    
    private func addLevelLabel() {
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.text = level
        levelLabel.textAlignment = .center
        levelLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 60)
        levelLabel.numberOfLines = 0
        levelLabel.minimumScaleFactor = 0.5
        levelLabel.adjustsFontSizeToFitWidth = true
        addSubview(levelLabel)
        addLevelLabelConstraints(forView: levelLabel)
    }
    
    func addTitleLabelConstraints(forView view: UIView) {
        buildConstraints([
            view.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -15),
            view.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.2),
            view.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func addLevelLabelConstraints(forView view: UIView) {
        buildConstraints([
            view.topAnchor.constraint(equalTo: centerYAnchor, constant: -25),
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.7)
        ])
    }
    
    func buildConstraints(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach { $0.isActive = true }
    }
}

