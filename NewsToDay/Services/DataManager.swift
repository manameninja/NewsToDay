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

enum Category: String, CaseIterable {
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
    
    static var random: Category {
        Category.allCases.randomElement() ?? .general
    }
}

final class DataManager {
    static let shared = DataManager()
    
    private var apiKey: String {
        ProcessInfo.processInfo.environment["API_KEY"] ?? ""
    }
    
    private var imageCaсhe: [String: Data] = [:]
    
    private init() {}
    
    func searchNews(with q: String, page: Int = 1, completion: @escaping ([News]) -> Void) {
        print("func searchNews(with q: String, page: Int = 1, completion: @escaping ([News]) -> Void) в разработке")
    }
    
    func getNews(category: Category, page: Int = 1, completion: @escaping ([News]) -> Void) {
        let url = Link.top.rawValue + "apiKey=" + apiKey + "&category=" + category.rawValue + "&page=\(page)"
        
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
    
    func getImage(_ url: String, completion: @escaping(Data) -> Void) {
        if let data = imageCaсhe[url] {
            completion(data)
            return
        }
        
        NetworkManager.shared.fetchImage(from: url) { [unowned self] result in
            switch result {
            case .success(let data):
                imageCaсhe[url] = data
                completion(data)
            case .failure(_):
                completion(Data())
            }
        }
    }
}
