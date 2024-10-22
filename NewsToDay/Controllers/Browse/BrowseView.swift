//
//  BrowseView.swift
//  NewsToDay
//
//  Created by nik on 22.10.24.
//

import UIKit

protocol BrowseViewDelegate: AnyObject {
    func buttonTapped()
}

final class BrowseView: UIView {
    //MARK: - Dependencies
    weak var delegate: BrowseViewDelegate?
    
    //MARK: - Private properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "folder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Text Label"
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstrains()
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setText(_ text: String) {
        textLabel.text = text
    }
}

//MARK: - Targets
private extension BrowseView {
    @objc func buttonTapped() {
        delegate?.buttonTapped()
    }
}

//MARK: - Setup UI
private extension BrowseView {
    func setupViews() {
        [
            imageView,
            titleLabel,
            textLabel,
            button
        ].forEach{ addSubview($0) }
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalTo: widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    func setupTargets() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}
