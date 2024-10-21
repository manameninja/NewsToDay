//
//  BookmarksViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 21.10.2024.
//

import UIKit

class BookmarksViewController: UIViewController {
    
    // MARK: - UI
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Bookmarks"
        element.font = UIFont(name: "Inter-Bold", size: 24)
        element.textColor = UIColor(named: "BlackPrimary")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let element = UILabel()
        element.text = "Saved articles to the library"
        element.font = UIFont(name: "Inter-Regular", size: 16)
        element.textColor = UIColor(named: "GreyPrimary")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.alignment = .leading
        element.spacing = 8
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var circleView: UIView = {
        let element = UIView()
        element.layer.cornerRadius = 36
        element.layer.masksToBounds = true
        element.backgroundColor = UIColor(named: "GreyLighter")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var bookIcon: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: "book.closed")
        element.tintColor = UIColor(named: "PurplePrimary")
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var withoutBookmarksLabel: UILabel = {
        let element = UILabel()
        element.text = "You haven't saved any articles yet. Start reading and bookmarking them now."
        element.font = UIFont(name: "Inter-Regular", size: 16)
        element.textColor = UIColor(named: "BlackPrimary")
        element.numberOfLines = 0
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var centralStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.alignment = .center
        element.spacing = 24
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupContraints()
        
    }
    
    //MARK: - Set Views
    private func setViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        self.navigationItem.titleView = stackView
        
        view.addSubview(centralStackView)
        circleView.addSubview(bookIcon)
        centralStackView.addArrangedSubview(circleView)
        centralStackView.addArrangedSubview(withoutBookmarksLabel)
   
    }
}

//MARK: - Setup Constraints
extension BookmarksViewController {
    func setupContraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            circleView.heightAnchor.constraint(equalToConstant: 72),
            circleView.widthAnchor.constraint(equalToConstant: 72),
            
            bookIcon.heightAnchor.constraint(equalToConstant: 24),
            bookIcon.widthAnchor.constraint(equalToConstant: 24),
            bookIcon.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            bookIcon.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            
            centralStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centralStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centralStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            centralStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),

        ])
    }
}
#Preview { BookmarksViewController() }
