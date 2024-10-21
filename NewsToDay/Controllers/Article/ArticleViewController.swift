//
//  ArticleViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 21.10.2024.
//

import UIKit
import SwiftUI

class ArticleViewController: UIViewController {
    
    let idTableViewCell = "idTableViewCell"
    
    //MARK: - UI elements
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .none
        tv.separatorStyle = .none
        tv.bounces = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
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
        view.backgroundColor = .red
        
        view.addSubview(tableView)
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc
    private func exampleButtonTapped() {
    }
    
    //MARK: - Methods
}

//MARK: - Set constraints
extension ArticleViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
}

////MARK: - ViewControllerPreview
//struct ViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        VCPreview {ArticleViewController()}
//    }
//}
