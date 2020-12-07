// Created by Christian Sarcona on 12/6/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {
    
    let backgroundImage = UIImageView()
    
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
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundImage.image = nil
    }
    
    func setupCell(withImage image: UIImage? = nil, level: String) {
        clipsToBounds = true
        setImage(image)
        
        setupImageView()
    }
    
    func setupImageView() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backgroundImage)
        setImageViewConstraints()
    }
    func setImageViewConstraints() {
        
        [
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -25),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 25),
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -25),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 25)
        ].forEach { $0.isActive = true }
    }
    
    func setImage(_ image: UIImage?) {
        backgroundImage.image = image
    }
}
