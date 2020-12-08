// Created by Christian Sarcona on 12/6/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {
    
    let backgroundImage = UIImageView()
    var levelView: LevelView?
    
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
    }
    
    func setupCell(withImage image: UIImage? = nil, level: String) {
        clipsToBounds = true
        setImage(image)
        
        setupImageView()
        if levelView == nil {
            setupLevelView(level: level)
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
        levelView?.translatesAutoresizingMaskIntoConstraints = false
        guard let levelView = levelView
        else {
            return
        }
        contentView.addSubview(levelView)
        setLevelViewConstraints(toView: levelView)
    }
    
    func setImageViewConstraints() {
        buildConstraints([
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -25),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 25),
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -25),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 25)
        ])
    }
    
    func setLevelViewConstraints(toView view: UIView) {
        let radius = bounds.height * 0.5
        buildConstraints([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            view.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            view.widthAnchor.constraint(equalToConstant: radius),
            view.heightAnchor.constraint(equalToConstant: radius)
        ])
    }
    
    func setImage(_ image: UIImage?) {
        backgroundImage.image = image
    }
    
    func buildConstraints(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach { $0.isActive = true }
    }
    
}
