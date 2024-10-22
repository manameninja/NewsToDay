//
//  OnboardingCollectionViewCell.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 22.10.2024.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    var titleLabel = UILabel()
    var textLabel = UILabel()
    var nextButton = UIButton()
    
    
    private var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSlide()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSlide() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textLabel)
        contentView.addSubview(nextButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        let screenHeight = contentView.frame.height
        
        titleLabel.textColor = .blackPrimary
        titleLabel.numberOfLines = 0
        
        textLabel.textColor = .greyPrimary
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        
        titleLabel.font = UIFont(name: "Inter-Bold", size: 24)
        textLabel.font = UIFont(name: "Inter-Medium", size: 16)
        
        nextButton.backgroundColor = .purplePrimary
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.textAlignment = .center
        nextButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 16)
        nextButton.layer.cornerRadius = 12
        nextButton.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: screenHeight * 0.1),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: screenHeight * 0.05),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
            
            nextButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func imageSetup(imageName: String) {
        let screenHeight = contentView.frame.height
        let screenWidth = contentView.frame.width
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(named: imageName)
        imageView.image = image
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: screenHeight * 0.15).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        imageView.heightAnchor.constraint(equalToConstant: screenHeight * 0.4).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: screenWidth * 0.77).isActive = true
    }
}
