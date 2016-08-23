//
//  ProfileNavigationController.swift
//  iOS Starter
//
//  Created by Wenqi on 8/22/16.
//  Copyright © 2016 wenqiwu. All rights reserved.
//

import UIKit

class ProfileNavigationController: AppNavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let vc = ProfileTableViewController()
        self.pushViewController(vc, animated: false)
    }
    
    func setupUI() {
        
    }
    
}
