//
//  ProfileView.swift
//  NewsToDay
//
//  Created by Катя on 23.10.2024.
//

import UIKit

final class ProfileView: UIView {

    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .image)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 36
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let labelsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Dev P"
        label.textColor = .blackPrimary
        label.font = UIFont(name: "Inter-SemiBold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "dev@gmail.com"
        label.textColor = .greyPrimary
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var languageButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(languageButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var termsConditionButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(termsConditionButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var signOutButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstraints()
        makeCustomButton(title: "Language", button: languageButton, image: "chevron.right")
        makeCustomButton(title: "Terms & Conditions", button: termsConditionButton, image: "chevron.right", padding: 160)
        makeCustomButton(title: "Sign Out", button: signOutButton, image: "iphone.and.arrow.forward")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    private func makeCustomButton(
        title: String,
        button: UIButton,
        image: String,
        padding: CGFloat = 240
    ) {
        button.layer.cornerRadius = 12
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        var configuration = UIButton.Configuration.gray()
        configuration.title = title
        configuration.baseForegroundColor = .greyDark
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { inc in
            var out = inc
            out.font = UIFont(name: "Inter-SemiBold", size: .init(16))
            return out
        }
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        configuration.baseBackgroundColor = .greyLighter
        configuration.cornerStyle = .medium
        configuration.image = UIImage(systemName: image)
        configuration.imagePlacement = .trailing
        configuration.imagePadding = padding
        button.configuration = configuration
        }
    
    
    @objc func languageButtonTapped(_ sender: UIButton) {
    }
    
    @objc func termsConditionButtonTapped(_ sender: UIButton) {
    }
    
    @objc func signOutButtonTapped(_ sender: UIButton) {
    }
 
    private func setupUI() {
        backgroundColor = .white
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(profileStackView)
        mainStackView.addArrangedSubview(buttonsStackView)
        
        profileStackView.addArrangedSubview(profileImageView)
        labelsView.addSubview(nameLabel)
        labelsView.addSubview(emailLabel)
        profileStackView.addArrangedSubview(labelsView)
        
        addSubview(languageButton)
        
        mainStackView.addArrangedSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(termsConditionButton)
        buttonsStackView.addArrangedSubview(signOutButton)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            profileStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            profileStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileStackView.heightAnchor.constraint(equalToConstant: 140),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 72),
            profileImageView.widthAnchor.constraint(equalToConstant: 72),
            
            labelsView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 36),
            labelsView.trailingAnchor.constraint(equalTo: profileStackView.trailingAnchor),
            
            nameLabel.centerYAnchor.constraint(equalTo: labelsView.centerYAnchor, constant: -10),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            
            languageButton.topAnchor.constraint(equalTo: profileStackView.bottomAnchor),
            languageButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            languageButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            languageButton.heightAnchor.constraint(equalToConstant: 56),
            
            buttonsStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            termsConditionButton.heightAnchor.constraint(equalToConstant: 56),
            signOutButton.heightAnchor.constraint(equalToConstant: 56)
   ]) }
}
