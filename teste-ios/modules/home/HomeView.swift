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
    
    var tableView = UITableView().with {
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 250
    }
    var footerView = FooterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraint()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CardCollectionViewCell.self, forCellReuseIdentifier: CardCollectionViewCell.reuseIdentifier)
    }
    func setupView() {
        view.addSubview(tableView)
        view.addSubview(footerView)
    }
    func setupConstraint() {
        (tableView).layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
        }
        footerView.layout {
            $0.top.equal(to: (tableView).bottomAnchor, offsetBy: 5)
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
            $0.height.constraint(equalToConstant: 140)
        }
    }
}
extension HomeView: UITableViewDelegate {
    
}
extension HomeView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardCollectionViewCell.reuseIdentifier) as?
                CardCollectionViewCell else { return UITableViewCell() }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        headerView.categoryLabel.text = "Categoria 1"
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}
