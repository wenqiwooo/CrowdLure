//
//  PurchaseNavigationController.swift
//  iOS Starter
//
//  Created by Wenqi on 8/25/16.
//  Copyright © 2016 wenqiwu. All rights reserved.
//

import UIKit

class PurchaseNavigationController: AppNavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let vc = PurchaseListViewController()
        self.pushViewController(vc, animated: false)
    }
    
    func setupUI() {
        
    }
    
}
