//
//  TermsConditionsViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 21.10.2024.
//

import UIKit

class TermsConditionsViewController: UIViewController {
    
    private(set) lazy var termsConditionsView: UIView = {
        let view = TermsConditionsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Terms & Conditions"
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
        view.addSubview(termsConditionsView)
        
        NSLayoutConstraint.activate([
            termsConditionsView.topAnchor.constraint(equalTo: view.topAnchor),
            termsConditionsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            termsConditionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            termsConditionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
