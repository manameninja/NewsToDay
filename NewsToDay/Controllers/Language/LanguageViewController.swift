//
//  LanguageViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 21.10.2024.
//

import UIKit

class LanguageViewController: UIViewController {
    
    let languageView: UIView = {
        let view = LanguageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Language"
        titleLabel.textColor = .blackPrimary
        titleLabel.font = UIFont(name: "Inter-SemiBold", size: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "arrow.left")
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.titleView = titleLabel
        
        view.addSubview(languageView)
                
        NSLayoutConstraint.activate([
        languageView.topAnchor.constraint(equalTo: view.topAnchor),
        languageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        languageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        languageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    ])
   }
}

