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
        let iv = UIImageView()
        iv.image = UIImage(named: "capitolBuilding.jpg")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var shareButton: UIButton = {
        let b = UIButton()
        b.tintColor = .white
        b.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        b.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var politicsButton: UIButton = {
        let b = UIButton(type: .system)
        b.backgroundColor = .purplePrimary
        b.layer.cornerRadius = 16
        b.setTitle("Politics", for: .normal)
        b.titleLabel?.font = UIFont(name: "Inter", size: 12)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(600))
        b.tintColor = .white
        b.addTarget(self, action: #selector(politicsButtonTapped), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    private let topLabel: UILabel = {
        let l = UILabel()
        l.text = "The latest situation in the presidential election"
        l.textColor = .white
        l.numberOfLines = 0
        l.adjustsFontSizeToFitWidth = true
        l.minimumScaleFactor = 0.5
        l.font = UIFont(name: "Inter", size: 20)
        l.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(700))
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let fullNameLabel: UILabel = {
        let l = UILabel()
        l.text = "John Doe"
        l.textColor = .white
        l.adjustsFontSizeToFitWidth = true
        l.minimumScaleFactor = 0.5
        l.font = UIFont(name: "Inter", size: 16)
        l.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(600))
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let autorNameLabel: UILabel = {
        let l = UILabel()
        l.text = "Аutor"
        l.textColor = .greyLight
        l.adjustsFontSizeToFitWidth = true
        l.minimumScaleFactor = 0.5
        l.font = UIFont(name: "Inter", size: 14)
        l.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(400))
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let descriptionTopLabel: UILabel = {
        let l = UILabel()
        l.text = "Results"
        l.textColor = .blackPrimary
        l.adjustsFontSizeToFitWidth = true
        l.minimumScaleFactor = 0.5
        l.font = UIFont(name: "Inter", size: 16)
        l.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(400))
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private let descriptionLabel: UILabel = {
        let l = UILabel()
        l.text = "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. \n\nFor more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters. \n\nLeads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters."
        l.textColor = .greyDark
        l.numberOfLines = 0
        l.adjustsFontSizeToFitWidth = true
        l.minimumScaleFactor = 0.5
        l.font = UIFont(name: "Inter", size: 16)
        l.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(400))
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
        backgroundColor = .white
        selectionStyle = .none
        addSubview(backgroundImageView)
        addSubview(shareButton)
        addSubview(politicsButton)
        addSubview(topLabel)
        addSubview(fullNameLabel)
        addSubview(autorNameLabel)
        addSubview(descriptionTopLabel)
        addSubview(descriptionLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 384),
            
            shareButton.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
            shareButton.widthAnchor.constraint(equalToConstant: 24),
            shareButton.heightAnchor.constraint(equalToConstant: 24),
            
            politicsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            politicsButton.topAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: 24),
            politicsButton.widthAnchor.constraint(equalToConstant: 75),
            politicsButton.heightAnchor.constraint(equalToConstant: 32),
            
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topLabel.topAnchor.constraint(equalTo: politicsButton.bottomAnchor, constant: 16),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            topLabel.heightAnchor.constraint(equalToConstant: 56),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            fullNameLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 24),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 24),
            
            autorNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            autorNameLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor),
            autorNameLabel.heightAnchor.constraint(equalToConstant: 24),
            
            descriptionTopLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionTopLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 24),
            descriptionTopLabel.heightAnchor.constraint(equalToConstant: 24),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTopLabel.bottomAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    @objc
    private func shareButtonTapped() {}
    
    @objc
    private func politicsButtonTapped() {}
    
    //MARK: - Methods
}

