// Created by Christian Sarcona on 12/8/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class ProgressView: UIView {
    
    let progressBar = ProgressBarView()
    let progressPointsLabel = UILabel()
    let totalPointsLabel = UILabel()
    
    init(frame: CGRect = CGRect.zero, progressPoints: String, totalPoints: String, progress: CGFloat) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        addProgressLabel(progressPoints: progressPoints)
        addTotalPointsLabel(totalPoints: totalPoints)
        addProgressBar(progress: progress)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func addProgressLabel(progressPoints points: String) {
        
        progressPointsLabel.text = points
        setupPointsLabel(progressPointsLabel)
        addProgressPointsLabelConstraints(progressPointsLabel)
    }
    
    private func addTotalPointsLabel(totalPoints: String) {
        totalPointsLabel.text = totalPoints
        setupPointsLabel(totalPointsLabel)
        addTotalPointsLabelConstraints(totalPointsLabel)
    }
    
    private func addProgressBar(progress: CGFloat) {
        progressBar.setProgress(toValue: progress)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(progressBar)
        addProgressBarConstraints(progressBar)
    }
    
    private func setupPointsLabel(_ label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = progressPointsLabel.font.withSize(18)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        addSubview(label)
    }
    
    private func addProgressPointsLabelConstraints(_ view: UIView) {
        buildConstraints([
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func addTotalPointsLabelConstraints(_ view: UIView) {
        buildConstraints([
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func addProgressBarConstraints(_ view: UIView) {
        buildConstraints([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: progressPointsLabel.topAnchor, constant: -10)
        ])
    }
    
}
