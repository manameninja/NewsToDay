//
//  DataManager.swift
//  NewsToDay
//
//  Created by nik on 22.10.24.
//

//Популярные
//business entertainment general health science sports technology

import Foundation

enum Link: String {
    case search = "https://newsapi.org/v2/everything?"
    case top = "https://newsapi.org/v2/top-headlines?"
}

enum Category: String {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
    
    var smile: String {
        switch self {
        case .business: return "💰"
        case .entertainment: return "🎬"
        case .general: return "📰"
        case .health: return "💙"
        case .science: return "🔬"
        case .sports: return "⚽️"
        case .technology: return "💡"
        }
    }
}

final class DataManager {
    static let shared = DataManager()
    
    var apiKey: String {
        ProcessInfo.processInfo.environment["API_KEY"] ?? ""
    }
    
    private init() {}
    
    func getNews(category: Category, page: Int = 1, completion: @escaping ([News]) -> Void) {
        
        let url = Link.top.rawValue + "api_key=" + apiKey + "category=" + category.rawValue + "&page=\(page)"
        
        NetworkManager.shared.fetch(ApiResponce.self, from: url) { result in
            switch result {
            case .success(let searchResult):
                completion(searchResult.articles)
            case .failure(let error):
                print(error)
                completion([])
            }
        }
    }
}
