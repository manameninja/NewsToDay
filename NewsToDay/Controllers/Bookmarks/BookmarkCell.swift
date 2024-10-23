//
//  BookmarkCell.swift
//  NewsToDay
//
//  Created by Maksim on 23.10.2024.
//

import UIKit

class BookmarkCell: UITableViewCell {
    
    // MARK: - UI
    private let articleImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
        element.layer.cornerRadius = 8
        element.backgroundColor = .blue
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: "Inter-Regular", size: 14)
        element.textColor = .greyPrimary
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let titleLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: "Inter-Medium", size: 24)
        element.textColor = .blackPrimary
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(articleImageView)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(titleLabel)
        
        
        NSLayoutConstraint.activate([
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            articleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            articleImageView.widthAnchor.constraint(equalToConstant: 96),
            articleImageView.heightAnchor.constraint(equalToConstant: 96),
            
            categoryLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 12),
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            titleLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: BookmarkModel) {
        articleImageView.image = model.image
        categoryLabel.text = model.category
        titleLabel.text = model.title
    }
}
