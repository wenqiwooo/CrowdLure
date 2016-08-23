//
//  AppEventTableViewCell.swift
//  iOS Starter
//
//  Created by Wenqi on 8/22/16.
//  Copyright © 2016 wenqiwu. All rights reserved.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {
    
    var title: String
    var owner: String
    var mainDesc: String
    var secondaryDesc: String
    var location: String
    var currentCount: Int
    var totalCount: Int
    
    var dataProvider: DiscoverCellDataProvider
    
    init() {
        self.dataProvider = DiscoverCellDataProvider()
        self.title = self.dataProvider.title
        self.owner = self.dataProvider.owner
        self.mainDesc = self.dataProvider.mainDesc
        self.secondaryDesc = self.dataProvider.secondaryDesc
        self.location = self.dataProvider.location
        self.currentCount = self.dataProvider.currentCount
        self.totalCount = self.dataProvider.totalCount
        super.init(style: .Default, reuseIdentifier: "AppEventTableViewCell")
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
    }
    
}
