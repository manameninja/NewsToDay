//
//  TermsConditionsView.swift
//  NewsToDay
//
//  Created by Катя on 21.10.2024.
//

import UIKit

class TermsConditionsView: UIView {
      
    private(set) lazy var textTermsConditions: String =
 """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. 

Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
"""
    
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private(set) lazy var termsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .greyPrimary
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Regular", size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstraints()
        makeAttributedText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeAttributedText() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        let attributedString = NSMutableAttributedString(string: textTermsConditions)
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        termsLabel.attributedText = attributedString
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(termsLabel)
        scrollView.addSubview(termsLabel)
        addSubview(scrollView)
    }
    
      private func makeConstraints() {
        let scrollContentGuide = scrollView.contentLayoutGuide
        let scrollFrameGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                        
            termsLabel.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor,constant: 20),
            termsLabel.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor, constant: -20),
            termsLabel.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor, constant: 20),
            termsLabel.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
        ])
    }
}
