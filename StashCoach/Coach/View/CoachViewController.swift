// Created by Christian Sarcona on 12/6/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

class CoachViewController: UIViewController, CoachPresenterOutputable {
    
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
        let widthMultiple: CGFloat = 0.85
        let heightMultiple: CGFloat = 0.9
        let itemWidth: CGFloat = view.bounds.width * widthMultiple
        let itemHeight: CGFloat = (view.bounds.height / 3) * heightMultiple
        let topInset: CGFloat = (view.bounds.width - (view.bounds.width * widthMultiple)) / 2
        let insets = UIEdgeInsets(top: topInset, left: 0, bottom: 50, right: 0)
        layout.sectionInset = insets
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

extension CoachViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
