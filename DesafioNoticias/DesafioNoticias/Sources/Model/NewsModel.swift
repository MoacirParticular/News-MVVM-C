//
//  NewsModel.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - News
struct NewsModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [ArticleModel]
}

// MARK: - Article
struct ArticleModel: Codable {
    let source: Source
    let author, title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}

typealias ArticlesModel = [ArticleModel]
