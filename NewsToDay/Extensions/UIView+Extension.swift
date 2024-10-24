//
//  UIView+Extension.swift
//  NewsToDay
//
//  Created by nik on 24.10.24.
//

import UIKit

extension UIView {
    static func makeLabelsView(with labels: UILabel..., alignment: UIStackView.Alignment = .leading) -> UIView {
        let container = UIView()
        
        let stack = UIStackView(arrangedSubviews: labels)
        stack.alignment = alignment
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
                
        container.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: container.topAnchor),
            stack.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
                        
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }
}
