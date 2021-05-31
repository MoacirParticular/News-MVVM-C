//
//  NewsManager.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import Foundation

protocol NewsManagerProtocol: AnyObject {
    func request(category: CategoryType, successHandler: @escaping (NewsViewModel) -> Void, failureHandler: @escaping (Error) -> Void)
}

final class NewsManager: NewsManagerProtocol {
    
    private var business: NewsBusinessProtocol?
    
    init(business: NewsBusinessProtocol?) {
        self.business = business
    }
    
    func request(category: CategoryType, successHandler: @escaping (NewsViewModel) -> Void, failureHandler: @escaping (Error) -> Void) {
        business?.request(category: category) { result in
            switch result {
            case .success(let model):
                let viewModel = NewsViewModel(model: model)
                successHandler(viewModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
}
