//
//  TabBarViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 23.10.2024.
//

import UIKit

class TabBarViewController: UITabBarController {
    private lazy var homeTab = getButton(icon: "house", tag: 0, action: action, color: .purplePrimary)
    private lazy var categoryTab = getButton(icon: "square.grid.2x2", tag: 1, action: action)
    private lazy var bookmarksTab = getButton(icon: "bookmark", tag: 2, action: action)
    private lazy var profileTab = getButton(icon: "person", tag: 3, action: action)
    
    private lazy var action = UIAction { [weak self] sender in
        guard let sender = sender.sender as? UIButton,
              let self = self
        else { return }
        
        self.selectedIndex = sender.tag
        self.setSelectedTintColor(tag: sender.tag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.addSubview(customBar)
        setupTabs()
    }
    
    private lazy var customBar: UIStackView = {
        
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.backgroundColor = .systemBackground
        stack.frame = CGRect(x: 0, y: view.frame.height - view.frame.height * 86/812, width: view.frame.width, height: view.frame.height * 86/812)
        
        stack.layer.cornerRadius = 15
        stack.layer.borderWidth = 2
        stack.layer.borderColor = UIColor.systemGray5.cgColor
        
        for tab in [UIView(), homeTab, categoryTab, bookmarksTab, profileTab, UIView()] {
            stack.addArrangedSubview(tab)
        }
                
        return stack
    }()
    
    private func setupTabs() {
        let homeVC = BrowseViewController()
        let categoryVC = OnboardingViewController()
        let bookmarksVC = BookmarksViewController()
        let profileVC = ProfileViewController()
        
        setViewControllers([homeVC, categoryVC, bookmarksVC, profileVC], animated: true)
    }
    
    private func getButton(icon: String, tag: Int, action: UIAction, color: UIColor = .greyLight) -> UIButton {
        return {
            $0.setImage(UIImage(systemName: icon), for: .normal)
            $0.tintColor = color
            $0.tag = tag
            return $0
        }(UIButton(primaryAction: action))
    }
    
    private func setSelectedTintColor(tag: Int) {
        [homeTab, categoryTab, bookmarksTab, profileTab].forEach { button in
            if button.tag != tag {
                button.tintColor = .greyLight
            } else {
                button.tintColor = .purplePrimary
            }
        }
    }
    
}

    //#Preview { TabBarViewController() }
