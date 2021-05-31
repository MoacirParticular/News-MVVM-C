//
//  NewsBusiness.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

protocol NewsBusinessProtocol {
    func request(category: CategoryType, completionHandler: @escaping NewsCompletionHandler)
}

class NewsBusiness: NewsBusinessProtocol {
    var provider: NewsProviderProtocol? = NewsProvider()
    
    func request(category: CategoryType, completionHandler: @escaping NewsCompletionHandler) {
        let parameters: [AnyHashable: Any] = [Constants.ParametersKeys.method: Constants.HTPMethod.get, Constants.ParametersKeys.category: category.rawValue]
        
        provider?.request(parameters: parameters, completionHandler: completionHandler)
    }
}
