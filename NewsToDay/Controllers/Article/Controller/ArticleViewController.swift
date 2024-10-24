//
//  ArticleViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 21.10.2024.
//

import UIKit
import SwiftUI

class ArticleViewController: UIViewController {
    
    var article = Article.testData
    
    let idTableViewCell = "idTableViewCell"
    
    //MARK: - UI elements
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
        
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: idTableViewCell)
    }
    
    //MARK: - Private methods
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        addLeftNavBarButton()
        addRightNavBarButton()
        addTransparentNavBar()
        
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc
    private func leftNavBarButtonTapped() {}
    
    @objc
    private func rightNavBarButtonTapped() {}
    
    //MARK: - Methods
    func addRightNavBarButton() {
        let rightNavBarButton = UIBarButtonItem(
            image: UIImage(systemName: "bookmark"),
            style: .plain,
            target: self,
            action: #selector(rightNavBarButtonTapped))
        navigationItem.rightBarButtonItem = rightNavBarButton
        rightNavBarButton.tintColor = .white
    }
    
    func addLeftNavBarButton() {
        let leftNavBarButton = UIBarButtonItem(
            image: UIImage(named: "backButton"),
            style: .plain,
            target: self,
            action: #selector(leftNavBarButtonTapped))
        navigationItem.leftBarButtonItem = leftNavBarButton
        leftNavBarButton.tintColor = .white
    }
    
    func addTransparentNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
}

//MARK: - Set constraints
extension ArticleViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -12),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

//MARK: - UITableViewDataSource
extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idTableViewCell, for: indexPath) as! ArticleTableViewCell
        
        if let defaultImage = UIImage(named: "capitolBuilding.jpg") {
            cell.cellConfigure(
                author: article.author ?? "",
                title: article.title ?? "",
                url: article.url ?? "",
                image: defaultImage,
                content: article.content ?? ""
            )
        }
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
              return 812
           }
        
        return UITableView.automaticDimension
    }
}

////MARK: - ViewControllerPreview
//struct ViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        VCPreview {ArticleViewController()}
//    }
//}
