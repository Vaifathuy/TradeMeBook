//
//  MarketsViewController.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/20/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class MarketsViewController: UIViewController,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var scienceCollectionView: UICollectionView!
    @IBOutlet weak var nonfictionCollectionView: UICollectionView!
    @IBOutlet weak var fictionCollectionView: UICollectionView!
    
    let bookImgs_fiction = [#imageLiteral(resourceName: "eleanor"),#imageLiteral(resourceName: "thehungergame"),#imageLiteral(resourceName: "fangirl"),#imageLiteral(resourceName: "theinfinitesea"),#imageLiteral(resourceName: "thefaultinourstar")]
    let bookImgs_nonfiction = [#imageLiteral(resourceName: "stevejobs"),#imageLiteral(resourceName: "thespace"),#imageLiteral(resourceName: "national"),#imageLiteral(resourceName: "diana"),#imageLiteral(resourceName: "god")]
    let bookImgs_science = [#imageLiteral(resourceName: "brainfood"),#imageLiteral(resourceName: "unlimited"),#imageLiteral(resourceName: "thisisgoingtohurt"),#imageLiteral(resourceName: "stephen"),#imageLiteral(resourceName: "elonmusk")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        //Load custom cell
        let bookCustomCell = UINib(nibName: "Book_Cell", bundle: nil)
        //Register to collectionView
        fictionCollectionView.register(bookCustomCell, forCellWithReuseIdentifier: "book_cell")
        nonfictionCollectionView.register(bookCustomCell, forCellWithReuseIdentifier: "book_cell")
        scienceCollectionView.register(bookCustomCell, forCellWithReuseIdentifier: "book_cell")
        //Register datasource to collectionViews
        fictionCollectionView.dataSource = self
        nonfictionCollectionView.dataSource = self
        scienceCollectionView.dataSource = self
        //Register delegate to collectionViews
        fictionCollectionView.delegate = self
        nonfictionCollectionView.delegate = self
        scienceCollectionView.delegate = self
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Title / Author / ISBN"
        navigationItem.searchController = searchController
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == fictionCollectionView {
            return bookImgs_fiction.count
        }else if collectionView == nonfictionCollectionView {
            return bookImgs_nonfiction.count
        }else{
            return bookImgs_science.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "book_cell", for: indexPath) as! Book_CellCollectionViewCell
        
        if collectionView == fictionCollectionView {
            let img = bookImgs_fiction[indexPath.row]
            cell.bookImg.image = img
        }else if collectionView == nonfictionCollectionView {
            let img = bookImgs_nonfiction[indexPath.row]
            cell.bookImg.image = img
        }else {
            let img = bookImgs_science[indexPath.row]
            cell.bookImg.image = img
        }
        return cell
    }
    
    //Adjust the size of the cell in collectionView : how the items in the collectionView flow
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.height - ( collectionView.frame.height / 2 )
        
        return CGSize(width: width, height: height)
    }
}
