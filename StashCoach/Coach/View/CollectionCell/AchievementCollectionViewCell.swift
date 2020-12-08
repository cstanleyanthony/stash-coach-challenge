// Created by Christian Sarcona on 12/6/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {
    
    let backgroundImage = UIImageView()
    var levelView: LevelView?
    var progressView: ProgressView?
    
    static let reuseId = "AchievementCell"
    
    /// Set the width to be a percent of the parent view
    static let widthMultiple: CGFloat = 0.85
    /// Set the height to be a percent of the the parent view
    static let heightMultiple: CGFloat = 0.75
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundImage.image = nil
        levelView?.removeFromSuperview()
        levelView = nil
        
        progressView?.removeFromSuperview()
        progressView = nil
    }
    
    func setupCell(withImage image: UIImage? = nil,
                   level: String,
                   progressPoints: String,
                   totalPoints: String,
                   progress: CGFloat) {
        clipsToBounds = true
        setImage(image)
        
        setupImageView()
        
        if levelView == nil {
            setupLevelView(level: level)
        }
        
        if progressView == nil {
            setupProgressView(progressPoints: progressPoints, totalPoints: totalPoints, progress: progress)
        }
    }
    
    func setupImageView() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFill
        contentView.addSubview(backgroundImage)
        setImageViewConstraints()
    }
    
    func setupLevelView(level: String) {
        
        levelView = LevelView(level: level)
        guard let levelView = levelView
        else {
            return
        }
        addNewSubview(levelView)
        setLevelViewConstraints(levelView)
    }
    
    func setupProgressView(progressPoints: String, totalPoints: String, progress: CGFloat) {
        progressView = ProgressView(progressPoints: progressPoints, totalPoints: totalPoints, progress: progress)
        guard let progressView = progressView
        else {
            return
        }
        addNewSubview(progressView)
        setProgressViewConstraints(progressView)
    }
    
    private func setImageViewConstraints() {
        buildConstraints([
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -25),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 25),
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -25),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 25)
        ])
    }
    
    private func setLevelViewConstraints(_ view: UIView) {
        let radius = bounds.height * 0.5
        buildConstraints([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            view.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            view.widthAnchor.constraint(equalToConstant: radius),
            view.heightAnchor.constraint(equalToConstant: radius)
        ])
    }
    
    private func setProgressViewConstraints(_ view: UIView) {
        buildConstraints([
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            view.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2)
        ])
    }
    
    func setImage(_ image: UIImage?) {
        backgroundImage.image = image
    }
    
    private func addNewSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
    }
    
}
