//
//  DiscoverTableView.swift
//  iOS Starter
//
//  Created by Wenqi on 8/23/16.
//  Copyright © 2016 wenqiwu. All rights reserved.
//

import UIKit

enum DiscoverCategory: String {
    case Nearby = "NEARBY",
    Favorites = "FAVORITES",
    Popular = "POPULAR"
}

class DiscoverTableView: UITableView {
    
    var category: DiscoverCategory
    
    init(category: DiscoverCategory) {
        self.category = category
        super.init(frame: CGRectZero, style: .Grouped)
        self.separatorColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}