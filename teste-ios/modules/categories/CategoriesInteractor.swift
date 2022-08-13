//
//  CategoriesInteractor.swift
//  teste-ios
//
//  Created by Fernando Gomes on 13/08/22.
//

import Foundation
protocol CategoriesInteractorProtocol {
    func fetchCategory(id: Int)
}
class CategoriesInteractor: CategoriesInteractorProtocol {
    var presenter: CategoriesPresenterProtocol?
    func fetchCategory(id: Int) {
        ApiService.getCategoryPosts(with: id) { response, error in
            if response != nil {
                
            }
        }
    }
}
