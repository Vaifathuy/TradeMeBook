//
//  MarketsViewController.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/20/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class MarketsViewController: UIViewController,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var selfhelpCollectionView: UICollectionView!
    @IBOutlet weak var horrorCollectionView: UICollectionView!
    @IBOutlet weak var scienceCollectionView: UICollectionView!
    @IBOutlet weak var nonfictionCollectionView: UICollectionView!
    @IBOutlet weak var fictionCollectionView: UICollectionView!
    
    let bookImgs_fiction = [#imageLiteral(resourceName: "eleanor"),#imageLiteral(resourceName: "thehungergame"),#imageLiteral(resourceName: "fangirl"),#imageLiteral(resourceName: "theinfinitesea"),#imageLiteral(resourceName: "ritual_nevill"),#imageLiteral(resourceName: "theexorcist"),#imageLiteral(resourceName: "thesentinel"),#imageLiteral(resourceName: "the7habits"),#imageLiteral(resourceName: "followMe"),#imageLiteral(resourceName: "stephen")]
    let bookImgs_nonfiction = [#imageLiteral(resourceName: "stevejobs"),#imageLiteral(resourceName: "thespace"),#imageLiteral(resourceName: "national"),#imageLiteral(resourceName: "diana"),#imageLiteral(resourceName: "god"),#imageLiteral(resourceName: "stephen"),#imageLiteral(resourceName: "thisisgoingtohurt"),#imageLiteral(resourceName: "brainfood"),#imageLiteral(resourceName: "elonmusk")]
    let bookImgs_science = [#imageLiteral(resourceName: "brainfood"),#imageLiteral(resourceName: "unlimited"),#imageLiteral(resourceName: "thisisgoingtohurt"),#imageLiteral(resourceName: "stephen"),#imageLiteral(resourceName: "elonmusk"),#imageLiteral(resourceName: "howtostopworrying"),#imageLiteral(resourceName: "improveyoursocialskill"),#imageLiteral(resourceName: "threehorror"),#imageLiteral(resourceName: "thescienceofgettingrich"),#imageLiteral(resourceName: "god")]
    let bookImgs_horror = [#imageLiteral(resourceName: "houseoffear"),#imageLiteral(resourceName: "followMe"),#imageLiteral(resourceName: "theexorcist"),#imageLiteral(resourceName: "thesentinel"),#imageLiteral(resourceName: "wearealwayswatching"),#imageLiteral(resourceName: "threehorror"),#imageLiteral(resourceName: "atozhorror"),#imageLiteral(resourceName: "ritual_nevill")]
    let bookImgs_selfhelp = [#imageLiteral(resourceName: "the7habits"),#imageLiteral(resourceName: "goodtogreat"),#imageLiteral(resourceName: "behappy"),#imageLiteral(resourceName: "ashortcourse"),#imageLiteral(resourceName: "improveyoursocialskill"),#imageLiteral(resourceName: "howtostopworrying"),#imageLiteral(resourceName: "thescienceofgettingrich"),#imageLiteral(resourceName: "elonmusk"),#imageLiteral(resourceName: "national")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        //Load custom cell
        let bookCustomCell = UINib(nibName: "Book_Cell", bundle: nil)
        //Register to collectionView
        fictionCollectionView.register(bookCustomCell, forCellWithReuseIdentifier: "book_cell")
        nonfictionCollectionView.register(bookCustomCell, forCellWithReuseIdentifier: "book_cell")
        scienceCollectionView.register(bookCustomCell, forCellWithReuseIdentifier: "book_cell")
        horrorCollectionView.register(bookCustomCell, forCellWithReuseIdentifier: "book_cell")
        selfhelpCollectionView.register(bookCustomCell, forCellWithReuseIdentifier: "book_cell")
        //Register datasource to collectionViews
        fictionCollectionView.dataSource = self
        nonfictionCollectionView.dataSource = self
        scienceCollectionView.dataSource = self
        horrorCollectionView.dataSource = self
        selfhelpCollectionView.dataSource = self
        //Register delegate to collectionViews
        fictionCollectionView.delegate = self
        nonfictionCollectionView.delegate = self
        scienceCollectionView.delegate = self
        horrorCollectionView.delegate = self
        selfhelpCollectionView.delegate = self
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
        }else if collectionView == scienceCollectionView {
            return bookImgs_science.count
        }else if collectionView == horrorCollectionView {
            return bookImgs_horror.count
        }else {
            return bookImgs_selfhelp.count
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
        }else if collectionView == scienceCollectionView {
            let img = bookImgs_science[indexPath.row]
            cell.bookImg.image = img
        }else if collectionView == horrorCollectionView {
            let img = bookImgs_horror[indexPath.row]
            cell.bookImg.image = img
        }else {
            let img = bookImgs_selfhelp[indexPath.row]
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
