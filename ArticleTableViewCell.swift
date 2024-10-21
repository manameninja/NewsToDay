//
//  ArticleTableViewCell.swift
//  NewsToDay
//
//  Created by Ildar Garifullin on 22.10.2024.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    //MARK: - UI elements
    let senderMyLabel: UILabel = {
        let l = UILabel()
        l.text = "Sender"
        l.textColor = .black
        l.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupViews() {
        backgroundColor = .yellow
        selectionStyle = .none
        addSubview(senderMyLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            senderMyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            senderMyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    //MARK: - Methods
}

