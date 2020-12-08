// Created by Christian Sarcona on 12/6/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class CoachViewController: CustomizedViewController, CoachPresenterOutputable {
    
    weak var collectionView: UICollectionView?
    var presenter: CoachPresenterInputable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        presenter?.viewDidLoad()
        
        setNavTitle()
    }
    
    private func setNavTitle() {
        title = presenter?.getTitle()
        
    }
    
    private func createLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        
        let topInset: CGFloat = (view.bounds.width - (view.bounds.width * AchievementCollectionViewCell.widthMultiple)) / 2
        let insets = UIEdgeInsets(top: topInset, left: 0, bottom: 50, right: 0)
        layout.sectionInset = insets
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .vertical
        
        return layout
    }
    
    private func setupCollectionView() {
        
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: createLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(AchievementCollectionViewCell.self, forCellWithReuseIdentifier: AchievementCollectionViewCell.reuseId)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        self.collectionView = collectionView
        setupCollectionViewConstraints()
    }
    
    private func setupCollectionViewConstraints() {
        [
            collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView?.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach { $0?.isActive = true }
    }
    
    func displayAchievements() {
        collectionView?.reloadData()
    }

}

extension CoachViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth: CGFloat = collectionView.bounds.width * AchievementCollectionViewCell.widthMultiple
        let itemHeight: CGFloat = itemWidth * AchievementCollectionViewCell.heightMultiple
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

extension CoachViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getItemCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementCollectionViewCell.reuseId,
                                                            for: indexPath) as? AchievementCollectionViewCell,
              let level = presenter?.getLevel(atIndex: indexPath.row),
              let progressPoints = presenter?.getProgressPoints(atIndex: indexPath.row),
              let totalPoints = presenter?.getTotalPoints(atIndex: indexPath.row),
              let progress = presenter?.getProgress(atIndex: indexPath.row),
              let accessible = presenter?.getAccessible(atIndex: indexPath.row)
        else {
            return UICollectionViewCell()
        }
        
        cell.setupCell(level: level,
                       progressPoints: progressPoints,
                       totalPoints: totalPoints,
                       progress: CGFloat(progress),
                       accessible: accessible)
        
        if let imageData = presenter?.getImageData(atIndex: indexPath.row),
           let image = UIImage(data: imageData) {
            cell.setImage(image)
        }
        
        return cell
    }
    
}
