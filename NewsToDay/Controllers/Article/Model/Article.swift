//
//  Article.swift
//  NewsToDay
//
//  Created by Ildar Garifullin on 23.10.2024.
//

import Foundation

struct Article {
    let author: String?
    let title: String?
    let url: String?
    let urlToImage: String?
    let content: String?
}

extension Article {
    static var testData = Article(
        author: "Nintendo Life",
        title: "Review: Romancing SaGa 2: Revenge Of The Seven (Switch) - A Remake That's Equally Intriguing & Underwhelming - Nintendo Life",
        url: "https://www.nintendolife.com/reviews/nintendo-switch/romancing-saga-2-revenge-of-the-seven",
        urlToImage: "https://images.nintendolife.com/d78e6a3d7995b/1280x720.jpg",
        content: "Captured on Nintendo Switch (Docked)\r\nSquare Enix has been putting out some AA mid-tier entries for some of its forgotten franchises lately, including Visions of Mana (not on Switch) and not one, but… [+5879 chars]"
    )
}
