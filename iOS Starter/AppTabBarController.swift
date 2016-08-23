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
        let appEventTableViewController = AppEventTableViewController()
        appEventTableViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: ""), selectedImage: nil)
        
        let appSettingsTableViewController = AppSettingsTableViewController()
        appSettingsTableViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: ""), selectedImage: nil)
        
        self.setViewControllers([appEventTableViewController, appSettingsTableViewController], animated: false)
    }
}
