//
//  LanguageView.swift
//  NewsToDay
//
//  Created by Катя on 23.10.2024.
//

import UIKit

 final class LanguageView: UIView {

    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private(set) lazy var englishButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(englishButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var russianButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(russianButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstraints()
        makeCustomButton(title: "English", button: englishButton)
        makeCustomButton(title: "Russian", button: russianButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func englishButtonPressed (_ sender: UIButton) {
        if sender.currentTitle == englishButton.currentTitle {
            englishButton.configuration?.baseForegroundColor = .white
            englishButton.configuration?.baseBackgroundColor = .purplePrimary
            englishButton.configuration?.image = UIImage(systemName: "checkmark")
            englishButton.configuration?.imagePlacement = .trailing
            englishButton.configuration?.imagePadding = 240
       
            russianButton.configuration?.baseForegroundColor = .greyDark
            russianButton.configuration?.baseBackgroundColor = .greyLighter
            russianButton.configuration?.image = nil
        }
    }
    
    @objc private func russianButtonPressed (_ sender: UIButton) {
        if sender.currentTitle == russianButton.currentTitle {
            russianButton.configuration?.baseForegroundColor = .white
            russianButton.configuration?.baseBackgroundColor = .purplePrimary
            russianButton.configuration?.image = UIImage(systemName: "checkmark")
            russianButton.configuration?.imagePlacement = .trailing
            russianButton.configuration?.imagePadding = 240
        
            englishButton.configuration?.baseForegroundColor = .greyDark
            englishButton.configuration?.baseBackgroundColor = .greyLighter
            englishButton.configuration?.image = nil
        }
    }
    
    private func makeCustomButton(title: String, button: UIButton) {
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
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        configuration.baseBackgroundColor = .greyLighter
        configuration.cornerStyle = .medium
        button.configuration = configuration
            }
        
        private func setupUI () {
            backgroundColor = .white
            addSubview(buttonStackView)
            buttonStackView.addArrangedSubview(englishButton)
            buttonStackView.addArrangedSubview(russianButton)
        }
        
        private func makeConstraints () {
            NSLayoutConstraint.activate([
                buttonStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
                buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                
                englishButton.heightAnchor.constraint(equalToConstant: 56),
                russianButton.heightAnchor.constraint(equalToConstant: 56),
            ])}
}
