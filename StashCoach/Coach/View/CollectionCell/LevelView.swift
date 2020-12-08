// Created by Christian Sarcona on 12/7/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class LevelView: UIView {
    
    private let circleLayer = CAShapeLayer()
    private let titleLabel = UILabel()
    private let levelLabel = UILabel()
    
    init(frame: CGRect = CGRect.zero, level: String) {
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
        addLevelLabel(level: level)
        
        layer.insertSublayer(circleLayer, below: titleLabel.layer)
    }
    
    private func addTitleLabel() {
        titleLabel.text = "Level"
        titleLabel.font = titleLabel.font.withSize(18)
        titleLabel.textColor = UIColor.black
        setupLabel(titleLabel)
        addSubview(titleLabel)
        addTitleLabelConstraints(titleLabel)
    }
    
    private func addLevelLabel(level: String) {
        levelLabel.text = level
        levelLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 60)
        setupLabel(levelLabel)
        addSubview(levelLabel)
        addLevelLabelConstraints(levelLabel)
    }
    
    private func setupLabel(_ label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = UIColor.black
    }
    
    func addTitleLabelConstraints(_ view: UIView) {
        buildConstraints([
            view.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -12),
            view.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.2),
            view.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func addLevelLabelConstraints(_ view: UIView) {
        buildConstraints([
            view.topAnchor.constraint(equalTo: centerYAnchor, constant: -25),
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.7)
        ])
    }
}

