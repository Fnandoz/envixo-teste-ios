//
//  HomeView.swift
//  teste-ios
//
//  Created by Fernando Gomes on 11/08/22.
//

import UIKit
import SkeletonView
import Tanjiro
protocol HomeViewProtocol {}
class HomeView: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).with {
        $0.backgroundColor = .white
    }
    var footerView = FooterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraint()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func setupView() {
        view.addSubview(collectionView)
        view.addSubview(footerView)
    }
    func setupConstraint() {
        collectionView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
        }
        footerView.layout {
            $0.top.equal(to: collectionView.bottomAnchor, offsetBy: 5)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
            $0.height.constraint(equalToConstant: 140)
        }
    }
}
extension HomeView: UICollectionViewDelegate{
    
}
extension HomeView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ArticleCardView else {
            return UICollectionViewCell()
        }
        cell.setupCard(imageId: 1, title: "Teste", description: "Teste", articleId: 123)
    
        return cell
    }
}
