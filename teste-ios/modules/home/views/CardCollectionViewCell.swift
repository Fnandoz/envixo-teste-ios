//
//  CardCollectionViewCell.swift
//  teste-ios
//
//  Created by Fernando Gomes on 13/08/22.
//

import UIKit
class CardCollectionViewCell: UITableViewCell {
    static var reuseIdentifier = "CardCollectionViewReuseIdentifier"
    private let collectionViewLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout).with {
        $0.isSkeletonable = true
        $0.showsHorizontalScrollIndicator = false
        $0.alwaysBounceVertical = false
        $0.alwaysBounceHorizontal = true
    }
    
    override func layoutSubviews() {
        setupView()
        setupConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        addSubview(collectionView)
        collectionView.register(ArticleCardView.self, forCellWithReuseIdentifier: ArticleCardView.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 180)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 5.0
        collectionView.collectionViewLayout = flowLayout
    }
    func setupConstraints() {
        collectionView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
    }
}
extension CardCollectionViewCell: UICollectionViewDelegate {}
extension CardCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCardView.reuseIdentifier, for: indexPath) as? ArticleCardView else {
            return UICollectionViewCell()
        }
        cell.setupCard(imageId: 123, title: "Teste", description: "Teste", articleId: 123)
        return cell
            
    }
}
