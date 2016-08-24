//
//  LureTableView.swift
//  iOS Starter
//
//  Created by Wenqi on 8/24/16.
//  Copyright © 2016 wenqiwu. All rights reserved.
//

import UIKit

class LureTableView: UITableView {
    
    init() {
        super.init(frame: CGRectZero, style: .Grouped)
        self.separatorColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}