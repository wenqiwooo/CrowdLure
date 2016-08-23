//
//  AppEventTableViewController.swift
//  iOS Starter
//
//  Created by Wenqi on 8/22/16.
//  Copyright © 2016 wenqiwu. All rights reserved.
//

import UIKit

class DiscoverListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let discoverToolbar = UIToolbar()
    private let discoverTableView = UITableView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Discover"
        
        let view = UIView.init(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor.whiteColor()
        self.view = view
        
        self.discoverToolbar.translatesAutoresizingMaskIntoConstraints = false
        
        self.discoverTableView.translatesAutoresizingMaskIntoConstraints = false
        self.discoverTableView.delegate = self
        self.discoverTableView.dataSource = self
        
        self.view.addSubview(self.discoverToolbar)
        self.view.addSubview(self.discoverTableView)
        
        self.setupLayoutConstraints()
    }
    
    func setupLayoutConstraints() {
        let views = [
            "discoverToolbar": self.discoverToolbar,
            "discoverTableView": self.discoverTableView
        ]
        
        var allConstraints = [NSLayoutConstraint]()
        
        let discoverToolbarXConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[discoverToolbar]|",
            options: [],
            metrics: nil,
            views: views)
        allConstraints += discoverToolbarXConstraints
        
        let discoverTableViewXConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[discoverTableView]|",
            options: [],
            metrics: nil,
            views: views)
        allConstraints += discoverTableViewXConstraints
        
        let discoverListYConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-64-[discoverToolbar][discoverTableView]-50-|",
            options: [],
            metrics: nil,
            views: views)
        allConstraints += discoverListYConstraints
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

}
