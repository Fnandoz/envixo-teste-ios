//
//  UrlsEnum.swift
//  teste-ios
//
//  Created by Fernando Gomes on 13/08/22.
//

import Foundation
enum ApiUrls {
    typealias RawValue = String
    case posts
    case post(id: Int)
    case categories
    case category(id: Int, perPage: Int = 10)
    case medias
    case media(id: Int)
    
    public init?(rawValue: String) {
        return nil
    }
    public var rawValue: String {
        switch self {
        case .posts:
            return "https://blog.coursify.me/wp-json/wp/v2/posts"
        case .post(let id):
            return "https://blog.coursify.me/wp-json/wp/v2/posts/\(id)"
        case .categories:
            return "https://blog.coursify.me/wp-json/wp/v2/categories"
        case .category(let id, let perPage):
            return "https://blog.coursify.me/wp-json/wp/v2/posts?categories=\(id)&per_page=\(perPage)"
        case .medias:
            return "https://blog.coursify.me/wp-json/wp/v2/media"
        case .media(let id):
            return "https://blog.coursify.me/wp-json/wp/v2/media/\(id)"
        }
    }
}
