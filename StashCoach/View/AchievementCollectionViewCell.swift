// Created by Christian Sarcona on 12/6/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {
    
    let backgroundImage = UIImageView()
    
    static let reuseId = "AchievementCell"
    
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
    
    func setImage(_ image: UIImage) {
        backgroundImage.image = image
    }
}
