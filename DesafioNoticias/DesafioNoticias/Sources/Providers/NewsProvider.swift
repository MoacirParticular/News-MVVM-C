//
//  NewsProvider.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import Foundation

typealias NewsCompletionHandler = (Result<NewsModel, Error>) -> Void

protocol NewsProviderProtocol {
    func request(parameters: [AnyHashable: Any], completionHandler: @escaping NewsCompletionHandler)
}

final class NewsProvider: NewsProviderProtocol {
    let apiProvider: ApiProvider
    
    init(apiProvider: ApiProvider = .shared) {
        self.apiProvider = apiProvider
    }
    
    func request(parameters: [AnyHashable : Any], completionHandler: @escaping NewsCompletionHandler) {
        let dict: NSDictionary = parameters as NSDictionary
        let method: String = parameters[Constants.ParametersKeys.method] as! String
        let category = dict[Constants.ParametersKeys.category] ?? ""
        
        let urlStr = "\(Constants.urlBase)\(category)&apiKey=\(Constants.apiKey)"
        
        guard let url = URL(string: urlStr) else {
            return
        }
        
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.httpMethod = method 
        
        print("path -> \(urlStr)")
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            do {
                if let error = error {
                    print(error)
                    completionHandler(.failure(error))
                }
                
                if let data = data {
                    
                    let apiRespone = try JSONDecoder().decode(NewsModel.self, from: data)
                    completionHandler(.success(apiRespone))
                } else {
                    
                    let erro = NSError()
                    
                    print("Error ao buscar as News")
                    completionHandler(.failure(erro))
                }
            } catch let error as NSError {
                print(error)
                completionHandler(.failure(error))
            }
        }
        
        task.resume();
    }
}
