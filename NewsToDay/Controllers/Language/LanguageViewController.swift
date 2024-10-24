//
//  LanguageViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 21.10.2024.
//

import UIKit

class LanguageViewController: UIViewController {
    
    let languageView = LanguageView()
    
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
        
        view = languageView
        
        for languageCase in Language.allCases {
            let button = UIButton.makeCustomButton(title: languageCase.rawValue, imageName: "checkmark")
            languageView.addButton(button)
        }
   }
}

