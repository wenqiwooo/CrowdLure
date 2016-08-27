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
        self.tabBar.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let discoverNC = DiscoverNavigationController()
        discoverNC.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(named: "discover.png"), selectedImage: nil)
        
        let searchNC = SearchNavigationController()
        searchNC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search.png"), selectedImage: nil)
        
        let purchaseNC = PurchaseNavigationController()
        purchaseNC.tabBarItem = UITabBarItem(title: "Purchases", image: UIImage(named: "purchases.png"), selectedImage: nil)
        
        let profileNC = ProfileNavigationController()
        profileNC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile.png"), selectedImage: nil)
        
        self.setViewControllers([discoverNC, searchNC, purchaseNC, profileNC], animated: false)
    }
}
