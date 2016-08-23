//
//  AppTabBarController.swift
//  iOS Starter
//
//  Created by Wenqi on 8/22/16.
//  Copyright © 2016 wenqiwu. All rights reserved.
//

import UIKit

class AppTabBarController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let discoverTableViewController = DiscoverNavigationController()
        discoverTableViewController.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(named: ""), selectedImage: nil)
        
        let searchViewController = SearchNavigationController()
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: ""), selectedImage: nil)
        
        let profileTableViewController = ProfileNavigationController()
        profileTableViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: ""), selectedImage: nil)
        
        self.setViewControllers([discoverTableViewController, searchViewController, profileTableViewController], animated: false)
    }
}
