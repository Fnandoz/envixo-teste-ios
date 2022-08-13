//
//  ApiService.swift
//  teste-ios
//
//  Created by Fernando Gomes on 11/08/22.
//

import Alamofire
class ApiService {
    typealias Callback = (String?, Error?) -> Void
    static func getPosts(completion: @escaping Callback) {
        AF.request(ApiUrls.posts.rawValue, method: .get, parameters: nil, encoding: URLEncoding.default).validate().responseString { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    static func getPost(with id: Int, completion: @escaping Callback) {
        AF.request(ApiUrls.post(id: id).rawValue, method: .get, parameters: nil, encoding: URLEncoding.default).validate().responseString { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    static func getCategories(completion: @escaping Callback) {
        AF.request(ApiUrls.categories.rawValue, method: .get, parameters: nil, encoding: URLEncoding.default).validate().responseString { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    static func getCategoryPosts(with id: Int, perPage: Int = 10, completion: @escaping Callback) {
        AF.request(ApiUrls.category(id: id, perPage: perPage).rawValue, method: .get, parameters: nil, encoding: URLEncoding.default).validate().responseString { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    static func getMedias(completion: @escaping Callback) {
        AF.request(ApiUrls.medias.rawValue, method: .get, parameters: nil, encoding: URLEncoding.default).validate().responseString { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    static func getMedia(with id: Int, completion: @escaping Callback) {
        AF.request(ApiUrls.media(id: id).rawValue, method: .get, parameters: nil, encoding: URLEncoding.default).validate().responseString { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
