// Created by Christian Sarcona on 12/6/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class AchievementsViewController: UIViewController {
    
    var collectionView: UICollectionView?
    var presenter: CoachPresenterInputable?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
//        presenter.viewDidLoad()
        
    }
    
    private func createLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        let itemWidth: CGFloat = view.bounds.width * 0.8
        let itemHeight: CGFloat = (view.bounds.height / 3) * 0.8
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        layout.scrollDirection = .vertical
        
        return layout
    }
    
    private func setupCollectionView() {
        
        collectionView = UICollectionView(frame: CGRect.zero,
                              collectionViewLayout: createLayout())
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.register(AchievementCollectionViewCell.self, forCellWithReuseIdentifier: AchievementCollectionViewCell.reuseId)
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        if let cv = collectionView { view.addSubview(cv) }
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

}

extension AchievementsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementCollectionViewCell.reuseId,
                                                            for: indexPath) as? AchievementCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    
}
