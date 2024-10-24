//
//  News.swift
//  NewsToDay
//
//  Created by nik on 22.10.24.
//

struct ApiResponce: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}

struct NewsSource: Codable {
    let id: String?
    let name: String?
}

struct News: Codable {
    let source: NewsSource
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum CodableKeys: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
}

