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
    var footerView = FooterView().with {
        $0.backgroundColor = .white
    }
    let itens: [UIColor] = [.red, .purple, .blue, .cyan, .yellow, .red, .green, .magenta, .systemTeal]
    private let reuseIdentifier = "cell"
    private let headerId = "headerId"
    private let categoryHeaderId = "categoryHeaderId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraint()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(ArticleCardView.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: categoryHeaderId, withReuseIdentifier: headerId)

        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.reloadData()
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
            $0.top.equal(to: collectionView.bottomAnchor, offsetBy: 33)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
            $0.height.constraint(equalToConstant: 50)
        }
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            switch sectionNumber {
            case 0: return self.firstLayoutSection()
            case 1: return self.firstLayoutSection()
            default: return self.firstLayoutSection()
            }
        }
    }
    private func firstLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension:
                .fractionalWidth(0.8))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 8, bottom: 0, trailing: 2)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
}
extension HomeView: UICollectionViewDelegate{
    
}
extension HomeView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 9
        default:
            return 5
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ArticleCardView else {
            return UICollectionViewCell()
        }
        cell.setupCard(imageId: 1, title: "Teste", description: "Teste", articleId: 123)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as? SectionHeaderView else {
            return UICollectionReusableView()
        }
        header.setupCard(title: "HEADER")
        return header
    }
}
