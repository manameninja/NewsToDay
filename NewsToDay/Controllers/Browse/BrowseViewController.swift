//
//  BrowseViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 21.10.2024.
//

import UIKit

final class BrowseViewController: UIViewController {
    
    private let browseView = BrowseView()
    
    override func loadView() {
        view = browseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        browseView.delegate = self
        
        view.backgroundColor = .white
        
        title = "Home"
    }
}

//MARK: -
extension BrowseViewController: BrowseViewDelegate {
    func buttonTapped() {
        print("Button Tapped")
        
        DataManager.shared.getNews(category: Category.random) { [unowned self] newsList in
            let news = newsList.first
            
            DataManager.shared.getImage(news?.urlToImage ?? "") { [unowned self] data in
                let image = UIImage(data: data) ?? UIImage(systemName: "person.fill.questionmark") ?? UIImage()
                DispatchQueue.main.async { [unowned self] in
                    browseView.setImage(image)
                }
            }
            
            DispatchQueue.main.async { [unowned self] in
                browseView.setTitle(news?.title ?? "Empty")
                browseView.setText((news?.description ?? "Empty description") + (news?.content ?? "Empty content"))
            }
        }
    }
}
