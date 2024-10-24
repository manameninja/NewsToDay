//
//  TabBarViewController.swift
//  NewsToDay
//
//  Created by Даниил Павленко on 23.10.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .purplePrimary
        tabBar.layer.cornerRadius = 15
        tabBar.backgroundColor = .systemBackground
        tabBar.unselectedItemTintColor = .greyLight
        tabBar.layer.borderColor = UIColor.greyLight.cgColor
        tabBar.layer.borderWidth = 1

        setupTabs()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var frame = tabBar.frame
        frame.size.height = view.frame.height * 86/812 + 15
        frame.origin.y = view.frame.height - view.frame.height * 86/812
        tabBar.frame = frame
    }
    
    private func setupTabs() {
        let homeVC = UINavigationController(rootViewController: BrowseViewController())
        let categoryVC = UINavigationController(rootViewController: OnboardingViewController())
        let bookmarksVC = UINavigationController(rootViewController: BookmarksViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 1)
        categoryVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "square.grid.2x2"), tag: 2)
        bookmarksVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bookmark"), tag: 3)
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person"), tag: 4)
        
        self.viewControllers = [homeVC, categoryVC, bookmarksVC, profileVC]
    }
}
