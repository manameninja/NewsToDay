//
//  TermsConditionsViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 21.10.2024.
//

import UIKit

class TermsConditionsViewController: UIViewController {
    
    static let textTermsConditions =
 """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. 

Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
"""
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let termsConditionsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .greyPrimary
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.text = textTermsConditions
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        let attributedString = NSMutableAttributedString(string: textTermsConditions)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
    }

    private func setupUI() {
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "arrow.left")
        navigationItem.largeTitleDisplayMode = .always
        let titleLabel = UILabel()
        titleLabel.text = "Terms & Conditions"
        titleLabel.font = UIFont(name: "Inter-SemiBold", size: 24)
        titleLabel.textColor = .blackPrimary
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
        
        view.backgroundColor = .white
        scrollView.contentSize = CGSize(width: textStackView.frame.width, height: textStackView.frame.height + 200)
        view.addSubview(scrollView)
        scrollView.addSubview(textStackView)
        textStackView.addArrangedSubview(termsConditionsLabel)
    }
    
      private func makeConstraints() {
        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                        
            textStackView.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor,constant: 20),
            textStackView.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor, constant: -20),
            textStackView.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor, constant: 20),
            textStackView.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
        ])
    }
}
