//
//  UIButton + Extension.swift
//  NewsToDay
//
//  Created by Катя on 24.10.2024.
//

import UIKit

extension UIButton {
    static func makeCustomButton(title: String, imageName: String) -> UIButton {
        let button = UIButton()
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
        button.imageView?.image = UIImage(systemName: imageName)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
