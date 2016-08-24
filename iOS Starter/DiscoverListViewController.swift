//
//  AppEventTableViewController.swift
//  iOS Starter
//
//  Created by Wenqi on 8/22/16.
//  Copyright © 2016 wenqiwu. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentModalView(vc:UIViewController, animated: Bool = true) {
        let nav = UINavigationController(rootViewController: vc)
        self.presentViewController(nav, animated: animated) {
            vc.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(UIViewController.dismissModalViewAnimated))
        }
    }
    
    func dismissModalViewAnimated() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

class DiscoverListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ACTabScrollViewDelegate, ACTabScrollViewDataSource {
    
    private let discoverTabScrollView = ACTabScrollView()
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
        
        self.discoverTabScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.discoverTabScrollView.defaultPage = 1
        self.discoverTabScrollView.tabSectionHeight = 40
        self.discoverTabScrollView.pagingEnabled = true
        self.discoverTabScrollView.cachedPageLimit = 3
        self.discoverTabScrollView.delegate = self
        self.discoverTabScrollView.dataSource = self
        
        self.view.addSubview(self.discoverTabScrollView)
        
        self.setupLayoutConstraints()
    }
    
    func setupLayoutConstraints() {
        let views = [
            "discoverTabScrollView": self.discoverTabScrollView
        ]
        
        var allConstraints = [NSLayoutConstraint]()
        
        let discoverToolbarXConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[discoverTabScrollView]|",
            options: [],
            metrics: nil,
            views: views)
        allConstraints += discoverToolbarXConstraints
        
        let discoverListYConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-65-[discoverTabScrollView]-49-|",
            options: [],
            metrics: nil,
            views: views)
        allConstraints += discoverListYConstraints
        
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
    
    // MARK: ACTabScrollViewDelegate
    func tabScrollView(tabScrollView: ACTabScrollView, didChangePageTo index: Int) {
        
    }

    func tabScrollView(tabScrollView: ACTabScrollView, didScrollPageTo index: Int) {
        
    }
    
    // MARK: ACTabScrollViewDataSource
    func numberOfPagesInTabScrollView(tabScrollView: ACTabScrollView) -> Int {
        return 3
    }
    
    func tabScrollView(tabScrollView: ACTabScrollView, tabViewForPageAtIndex index: Int) -> UIView {
        // create a label
        let label = UILabel()
        switch index {
        case 0:
            label.text = DiscoverCategory.Nearby.rawValue
        case 1:
            label.text = DiscoverCategory.Popular.rawValue
        case 2:
            label.text = DiscoverCategory.Favorites.rawValue
        default:
            break
        }
        label.font = UIFont.systemFontOfSize(16, weight: UIFontWeightThin)
        label.textColor = UIColor(red: 77.0 / 255, green: 79.0 / 255, blue: 84.0 / 255, alpha: 1)
        label.textAlignment = .Center
        
        // if the size of your tab is not fixed, you can adjust the size by the following way.
        label.sizeToFit() // resize the label to the size of content
        label.frame.size = CGSize(width: label.frame.size.width + 28, height: label.frame.size.height + 22) // add some paddings
        return label
    }
    
    func tabScrollView(tabScrollView: ACTabScrollView, contentViewForPageAtIndex index: Int) -> UIView {
        var discoverTableView: DiscoverTableView!
        
        switch (index) {
        case 0:
            discoverTableView = DiscoverTableView(category: .Nearby)
        case 1:
            discoverTableView = DiscoverTableView(category: .Popular)
        case 2:
            discoverTableView = DiscoverTableView(category: .Favorites)
        default:
            break
        }
        
        discoverTableView.delegate = self
        discoverTableView.dataSource = self
        discoverTableView.registerClass(DiscoverCell.self, forCellReuseIdentifier: "DiscoverCell")
        return discoverTableView
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let discoverTableView = tableView as? DiscoverTableView {
            switch (discoverTableView.category) {
            case .Nearby:
                return 1
            case .Popular:
                return 2
            case .Favorites:
                return 3
            }
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 240
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let discoverTableView = tableView as? DiscoverTableView {
            switch (discoverTableView.category) {
            case .Nearby:
                break
            case .Popular:
                break
            case .Favorites:
                break
            }
        }
        return DiscoverCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        if let discoverTableView = tableView as? DiscoverTableView {
            switch (discoverTableView.category) {
            case .Nearby:
                break
            case .Popular:
                break
            case .Favorites:
                break
            }
            let vc = LureDetailViewController()
            self.presentModalView(vc)
        }
    }
}
