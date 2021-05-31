//
//  NewsViewModel.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import Foundation

class NewsViewModel {    
    let model: NewsModel
    
    public init(model: NewsModel) {
        self.model = model
    }
    
    public var articles: ArticlesModel {
        model.articles
    }
    
    static func fetchData(category: CategoryType, completion: @escaping (Result<NewsViewModel, Error>) -> Void) {
        let manager: NewsManagerProtocol = NewsManager(business: NewsBusiness())
        manager.request(category: category) { (newsViewModel) in
            completion(.success(newsViewModel))
        } failureHandler: { (Error) in
            completion(.failure(Error))
        }
    }
}

