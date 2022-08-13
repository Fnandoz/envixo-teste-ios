//
//  HomeInteractor.swift
//  teste-ios
//
//  Created by Fernando Gomes on 11/08/22.
//

import Foundation
protocol HomeInteractorProtocol {
    func fetchCategories()
    func fetchPostsForCategory(id: Int)
}
class HomeInteractor {
    var presenter: HomePresenterProtocol?
    
}
