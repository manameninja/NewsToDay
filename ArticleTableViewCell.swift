//
//  ArticleTableViewCell.swift
//  NewsToDay
//
//  Created by Ildar Garifullin on 22.10.2024.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    //MARK: - UI elements
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "capitolBuilding.jpg")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var politicsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .purplePrimary
        button.layer.cornerRadius = 16
        button.setTitle("Politics", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter", size: 12)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(600))
        button.tintColor = .white
        button.addTarget(self, action: #selector(politicsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "The latest situation in the presidential election"
        label.textColor = .white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont(name: "Inter", size: 20)
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(700))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "John Doe"
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont(name: "Inter-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let autorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Аutor"
        label.textColor = .greyLight
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionTopLabel: UILabel = {
        let label = UILabel()
        label.text = "Results"
        label.textColor = .blackPrimary
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont(name: "Inter-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. \n\nFor more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters. \n\nLeads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters."
        label.textColor = .greyDark
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        backgroundColor = .white
        selectionStyle = .none
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(shareButton)
        contentView.addSubview(politicsButton)
        contentView.addSubview(topLabel)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(autorNameLabel)
        contentView.addSubview(descriptionTopLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 384),
            
            shareButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            shareButton.widthAnchor.constraint(equalToConstant: 24),
            shareButton.heightAnchor.constraint(equalToConstant: 24),
            
            politicsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            politicsButton.topAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: 24),
            politicsButton.widthAnchor.constraint(equalToConstant: 75),
            politicsButton.heightAnchor.constraint(equalToConstant: 32),
            
            topLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            topLabel.topAnchor.constraint(equalTo: politicsButton.bottomAnchor, constant: 16),
            topLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            topLabel.heightAnchor.constraint(equalToConstant: 56),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            fullNameLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 24),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 24),
            
            autorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            autorNameLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor),
            autorNameLabel.heightAnchor.constraint(equalToConstant: 24),
            
            descriptionTopLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionTopLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 24),
            descriptionTopLabel.heightAnchor.constraint(equalToConstant: 24),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTopLabel.bottomAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    @objc
    private func shareButtonTapped() {
        print("share")
    }
    
    @objc
    private func politicsButtonTapped() {
        print("politics")
    }
    
    //MARK: - Methods
    func cellConfigure(
        author: String,
        title: String,
        url: String,
        image: UIImage,
        content: String
    ) {
        backgroundImageView.image = image
        topLabel.text = title
        fullNameLabel.text = author
        descriptionLabel.text = content
    }
}

