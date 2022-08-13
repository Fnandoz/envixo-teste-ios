//
//  CategoriesView.swift
//  teste-ios
//
//  Created by Fernando Gomes on 13/08/22.
//

import UIKit
import Tanjiro
import SkeletonView
protocol CategoriesViewProtocol {}
class CategoriesView: UIViewController, CategoriesViewProtocol {
    var presenter: CategoriesPresenterProtocol?
    var tableView = UITableView().with {
        $0.isSkeletonable = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func setupViews(){
        view.addSubview(tableView)
    }
    func setupConstraints() {
        tableView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
    }
}
extension CategoriesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension CategoriesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
