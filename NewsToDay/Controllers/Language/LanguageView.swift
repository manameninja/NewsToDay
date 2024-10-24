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
     
    private var buttons: [UIButton] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
     func addButton(_ button: UIButton) {
         button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
         buttons.append(button)
         buttonStackView.addArrangedSubview(button)
         button.heightAnchor.constraint(equalToConstant: 56).isActive = true
     }
     
     @objc func buttonPressed(_ sender: UIButton) {
         buttons.forEach { button in
             if button == sender {
                 button.configuration?.baseForegroundColor = .white
                 button.configuration?.baseBackgroundColor = .purplePrimary
                 button.configuration?.image = UIImage(systemName: "checkmark")
                 button.configuration?.imagePlacement = .trailing
                 button.configuration?.imagePadding = 236
             } else {
                 button.configuration?.baseForegroundColor = .greyDark
                 button.configuration?.baseBackgroundColor = .greyLighter
                 button.configuration?.image = nil
             }
         }
     }
        
        private func setupUI () {
            backgroundColor = .white
            addSubview(buttonStackView)
        }
        
        private func makeConstraints () {
            NSLayoutConstraint.activate([
                buttonStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
                buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ])}
}
