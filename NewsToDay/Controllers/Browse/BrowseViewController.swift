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
    }
}

//MARK: -
extension BrowseViewController: BrowseViewDelegate {
    func buttonTapped() {
        print("Button Tapped")
        
        browseView.setImage(UIImage(systemName: "book") ?? UIImage())
        browseView.setTitle(Link.search.rawValue)
        browseView.setText(DataManager.shared.apiKey)
    }
}
