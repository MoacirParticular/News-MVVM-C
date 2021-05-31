//
//  ApiProvider.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import Foundation

public typealias CompletionData = (statusCode: Int, data: Data)
public typealias CompletionCallback = (@escaping () throws -> CompletionData) -> Void

public class ApiProvider {
    public static let shared = ApiProvider()
    
    
    public init() {
        
    }
    
    func request(parameters: [AnyHashable : Any], completionHandler: @escaping CompletionCallback) {
        
    }
}
