//
//  SearchViewController.swift
//  iOS Starter
//
//  Created by Wenqi on 8/22/16.
//  Copyright © 2016 wenqiwu. All rights reserved.
//

import UIKit

class SearchViewController: UICollectionViewController {
    
    let categories = [
        "Restaurants",
        "Beauty",
        "Music",
        "Sports & Outdoors",
        "Computers",
        "Books",
        "Movies & TV",
        "Office Products",
        "Toys & Games",
        "Video Games"
    ]
    
    var searchController: UISearchController!
    var searchResultsController: SearchResultsController!

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        self.collectionView?.backgroundColor = UIColor.groupTableViewBackgroundColor()
        self.collectionView?.registerClass(CategoryCollectionCell.self, forCellWithReuseIdentifier: "CategoryCell")
    }
    
    func setupSearchController() {
        self.searchResultsController = SearchResultsController()
        self.searchResultsController.parentVC = self
        self.searchController = UISearchController(searchResultsController: self.searchResultsController)
        self.searchController.searchResultsUpdater = self.searchResultsController
        self.searchController.delegate = self.searchResultsController
        self.searchController.searchBar.delegate = self.searchResultsController
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.navigationItem.titleView = self.searchController.searchBar
        self.definesPresentationContext = true
    }
    
    // MARK: CollectionView
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let len = (UIScreen.mainScreen().bounds.width - 4 * 10) / 3
        return CGSize(width: len, height: len)
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryCell", forIndexPath: indexPath) as! CategoryCollectionCell
        cell.backgroundColor = UIColor.greenColor()
        cell.updateUI(self.categories[indexPath.row])
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
}

