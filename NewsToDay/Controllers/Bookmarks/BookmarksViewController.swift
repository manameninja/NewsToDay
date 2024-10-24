//
//  BookmarksViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 21.10.2024.
//

import UIKit

class BookmarksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    
    var navigationTitleView = UIView()
    
    private let articles: [BookmarkModel] = [
        BookmarkModel(category: "UI/UX Design", title: "A Simple Trick For Creating Color Palettes Quickly", image: UIImage(systemName: "sun.min") ?? UIImage()),
        BookmarkModel(category: "UI/UX Design", title: "A Simple Trick For Creating Color Palettes Quickly", image: UIImage(systemName: "sun.min") ?? UIImage())
        ]
    
    // MARK: - UI
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Bookmarks"
        element.font = UIFont(name: "Inter-Regular", size: 24)
        element.textColor = .blackPrimary
        element.textAlignment = .left
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let element = UILabel()
        element.text = "Saved articles to the library"
        element.font = UIFont(name: "Inter-Regular", size: 16)
        element.textColor = .greyPrimary
        element.textAlignment = .left
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let testLabel: UILabel = {
        let element = UILabel()
        element.text = "Test Label"
        element.font = UIFont(name: "Inter-Regular", size: 16)
        element.textColor = .blue
        element.textAlignment = .left
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
//    private lazy var stackView: UIStackView = {
//        let element = UIStackView()
//        element.axis = .vertical
//        element.alignment = .leading
//        element.spacing = 8
//        element.translatesAutoresizingMaskIntoConstraints = false
//        return element
//    }()
    
    private lazy var circleView: UIView = {
        let element = UIView()
        element.layer.cornerRadius = 36
        element.layer.masksToBounds = true
        element.backgroundColor = .greyLighter
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var bookIcon: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: "book.closed")
        element.tintColor = .purplePrimary
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var withoutBookmarksLabel: UILabel = {
        let element = UILabel()
        element.text = "You haven't saved any articles yet. Start reading and bookmarking them now."
        element.font = UIFont(name: "Inter-Regular", size: 16)
        element.textColor = .blackPrimary
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
        
        
        tableView.delegate = self
        tableView.dataSource = self
                
        tableView.register(BookmarkCell.self, forCellReuseIdentifier: "BookmarkCell")
        
        view.backgroundColor = .white
    }
    //MARK: - Set Views
    private func setViews() {
        //view.addSubview(stackView)
        //stackView.addArrangedSubview(titleLabel)
        //stackView.addArrangedSubview(subtitleLabel)
        
        let navigationTitleView = UIView.makeLabelsView(with: titleLabel, subtitleLabel)
        let navigationTitleItem = UIBarButtonItem(customView: navigationTitleView)
        navigationItem.leftBarButtonItem = navigationTitleItem
        
        view.addSubview(centralStackView)
        circleView.addSubview(bookIcon)
        centralStackView.addArrangedSubview(circleView)
        centralStackView.addArrangedSubview(withoutBookmarksLabel)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - UITableViewDataSource
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return articles.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           //let cell = UITableViewCell()
           let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath) as! BookmarkCell
           cell.configure(with: articles[indexPath.row])
           return cell
       }
       
       // MARK: - UITableViewDelegate
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           view.frame.size.height * 96 / 812
       }
}

//MARK: - Setup Constraints
extension BookmarksViewController {
    func setupContraints() {
        NSLayoutConstraint.activate([
            //stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            //stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
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
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            navigationTitleView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}


