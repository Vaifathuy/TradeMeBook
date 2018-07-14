//
//  BookDetailViewController.swift
//  TradeMeBook
//
//  Created by Vaifat Huy on 6/23/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    //BookDetail Views and Labels
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var sellerView: UIView!
    @IBOutlet weak var ISBNView: UIView!
    @IBOutlet weak var languageView: UIView!
    
    @IBOutlet weak var ISBNLabel: UILabel!
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    //-----------------------
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageControlBG: UIView!
    @IBOutlet weak var genres3: UITextField!
    @IBOutlet weak var genres2: UITextField!
    @IBOutlet weak var genres1: UITextField!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var authorName: UITextField!
    @IBOutlet weak var bookImagesCollectionView: UICollectionView!
    var bookImages : [UIImage] = [#imageLiteral(resourceName: "fangirl"),#imageLiteral(resourceName: "the7habits"),#imageLiteral(resourceName: "thesentinel")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupCollectionView()
        fetchData()
        decorateBGViews(genres: [genres1,genres2,genres3], cornerRadius: 14.0, borderWidth: 1.0 )
        decorateBGViews(genres: [authorName], cornerRadius: 9, borderWidth: 1.0)
        bookTitle.text = "Fangirl"
        
        decoratePageControlForBookCover()
        decorateBGViews(genres: [ISBNView,sellerView,languageView], cornerRadius: 22.0, borderWidth: 1.5)
        decorateBGViews(genres: [titleView], cornerRadius: 18.0, borderWidth: 1.0)

    }
    
    func fetchData(){
        
    }
    
    func decoratePageControlForBookCover(){
        pageControlBG.layer.cornerRadius = 10.0
        pageControlBG.layer.borderWidth = 0.3
        pageControlBG.layer.borderColor = UIColor.orange.cgColor
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.numberOfPages = bookImages.count

    }
    
    func decorateBGViews(genres: [UIView], cornerRadius: CGFloat, borderWidth: CGFloat){
        for g in genres {
            g.layer.borderWidth = borderWidth
            g.layer.cornerRadius = cornerRadius
            g.layer.borderColor = UIColor.orange.cgColor
        }
    }
    
    func setupCollectionView() {
        if let flowLayout = bookImagesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 2.0
            bookImagesCollectionView.collectionViewLayout = flowLayout
            bookImagesCollectionView.isPagingEnabled = true
            bookImagesCollectionView.dataSource = self
        }
    }
    
    func setupNavBar() {
        let ReviewBarButton = UIBarButtonItem()
        
        //Navigation Title: based on the type of book - Paperback, Hardcover
        navigationItem.title = "Paper"
        
        //RightBarButton
        ReviewBarButton.title = "Review"
        navigationController?.navigationBar.tintColor = UIColor.orange
        navigationItem.rightBarButtonItem = ReviewBarButton
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookImages_cell", for: indexPath) as! ImagesInBookDetailCollectionViewCell
        let bookImage = bookImages[indexPath.row]
        cell.bookImages.image = bookImage
        self.pageControl.currentPage = indexPath.row + 1
        return cell
    }


    @IBAction func btnBuynow(_ sender: Any) {
    }
}
