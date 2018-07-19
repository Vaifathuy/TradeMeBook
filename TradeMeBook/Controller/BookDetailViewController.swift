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
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!
    //-------------------------
    
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionContent: UITextView!
    
    //-------------------------
    @IBOutlet weak var bookType: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageControlBG: UIView!
    @IBOutlet weak var genres3: UITextField!
    @IBOutlet weak var genres2: UITextField!
    @IBOutlet weak var genres1: UITextField!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var authorName: UITextField!
    @IBOutlet weak var bookImagesCollectionView: UICollectionView!
    @IBOutlet weak var otherSellersCollectionView: UICollectionView!
    @IBOutlet weak var customerAlsoViewedCollectionView: UICollectionView!
    @IBOutlet weak var customerAlsoViewedView: UIView!
    @IBOutlet weak var otherSellerView: UIView!
    
    //--Constraints --
    
    @IBOutlet weak var mainViewConstraint: NSLayoutConstraint!
    
    
    //-- Sample Data --
    var bookImages : [UIImage] = [#imageLiteral(resourceName: "fangirl"),#imageLiteral(resourceName: "the7habits"),#imageLiteral(resourceName: "thesentinel")]
    var otherSellersSuggestionList = [sellersSuggestion(bookCover: #imageLiteral(resourceName: "fangirl"), sellerName: "Reaksmey"),
                                      sellersSuggestion(bookCover: #imageLiteral(resourceName: "fangirl"), sellerName: "Kunthea"),
                                      sellersSuggestion(bookCover: #imageLiteral(resourceName: "fangirl"), sellerName: "Boremey"),
                                      sellersSuggestion(bookCover: #imageLiteral(resourceName: "fangirl"), sellerName: "Oudom"),
                                      sellersSuggestion(bookCover: #imageLiteral(resourceName: "fangirl"), sellerName: "John"),
                                      sellersSuggestion(bookCover: #imageLiteral(resourceName: "fangirl"), sellerName: "SivMey")
                                     ]
    var customerAlsoViewedList = [sellersSuggestion(bookCover: #imageLiteral(resourceName: "thespace"), sellerName: "SivMey"),
                                  sellersSuggestion(bookCover: #imageLiteral(resourceName: "eleanor"), sellerName: "Oudom"),
                                  sellersSuggestion(bookCover: #imageLiteral(resourceName: "thehungergame"), sellerName: "Kunthea"),
                                  sellersSuggestion(bookCover: #imageLiteral(resourceName: "theinfinitesea"), sellerName: "John"),
                                  sellersSuggestion(bookCover: #imageLiteral(resourceName: "thefaultinourstar"), sellerName: "Terry"),
                                  sellersSuggestion(bookCover: #imageLiteral(resourceName: "threehorror"), sellerName: "Sok Vannak")
                                 ]
    //------
    var bookTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        bindData()
        setupNavBar()
        setupCollectionView()
        decorateBGViews(genres: [genres1,genres2,genres3], cornerRadius: 14.0, borderWidth: 1.0 )
        decorateBGViews(genres: [authorName], cornerRadius: 9, borderWidth: 1.0)
        
        decoratePageControlForBookCover()
        decorateBGViews(genres: [ISBNView,sellerView,languageView], cornerRadius: 22.0, borderWidth: 1.5)
        decorateBGViews(genres: [titleView], cornerRadius: 18.0, borderWidth: 1.0)
        decorateBGViews(genres: [descriptionLabel,descriptionView], cornerRadius: 12.0, borderWidth: 1.5)
        decorateBGViews(genres: [otherSellerView, customerAlsoViewedView], cornerRadius: 22.0, borderWidth: 1.5)
        print(Constant.stateTextSize())
    }
    
    func fetchData(){
        
    }
    
    func bindData(){
        bookTitle = "Fangirl"
        bookType.text = "Paperback"
        genres1.text = "Love"
        genres2.text = "Teen"
        genres3.text = "Fiction"
        genres1.font = UIFont.systemFont(ofSize: Constant.genresTextSize())
        genres2.font = UIFont.systemFont(ofSize: Constant.genresTextSize())
        genres3.font = UIFont.systemFont(ofSize: Constant.genresTextSize())
        authorName.text = "Rainbow Rowell"
        ratingImage.image = UIImage(named: "ic_rating_4.5_filled")
        //------
        ISBNLabel.text = "9856721345012"
        sellerName.text = "Helen Yogy"
        languageLabel.text = "ENG, CHN, ESP"
        
        //------
        let currency = "$"
        priceLabel.text = "10.9" + currency
        qtyLabel.text = "28"
        stateLabel.text = "NEW"  //NEW or OLD
        
        priceLabel.font = UIFont.boldSystemFont(ofSize: Constant.stateTextSize())
        qtyLabel.font = UIFont.boldSystemFont(ofSize: Constant.stateTextSize())
        stateLabel.font = UIFont.boldSystemFont(ofSize: Constant.stateTextSize())
        
        //-------
        //descriptionContent.text = ""
        
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
        
        if let flowLayoutForOtherSeller = otherSellersCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayoutForOtherSeller.scrollDirection = .horizontal
            flowLayoutForOtherSeller.minimumLineSpacing = 0
            flowLayoutForOtherSeller.minimumInteritemSpacing = 0
            otherSellersCollectionView.collectionViewLayout = flowLayoutForOtherSeller
            otherSellersCollectionView.dataSource = self
            otherSellersCollectionView.delegate = self
        }
        
        if let flowLayoutFotCustomerViewed = customerAlsoViewedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayoutFotCustomerViewed.scrollDirection = .horizontal
            flowLayoutFotCustomerViewed.minimumLineSpacing = 0
            customerAlsoViewedCollectionView.collectionViewLayout = flowLayoutFotCustomerViewed
            customerAlsoViewedCollectionView.dataSource = self
            customerAlsoViewedCollectionView.delegate = self
        }
    }
    
    func setupNavBar() {
        let ReviewBarButton = UIBarButtonItem()
        
        //Navigation Title: based on the type of book - Paperback, Hardcover
        navigationItem.title = self.bookTitle
        
        //RightBarButton
        ReviewBarButton.title = "Review"
        navigationController?.navigationBar.tintColor = UIColor.orange
        navigationItem.rightBarButtonItem = ReviewBarButton
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.bookImagesCollectionView {
            pageControl.numberOfPages = bookImages.count
            return bookImages.count
        }else if collectionView == self.otherSellersCollectionView {
            return otherSellersSuggestionList.count
        }else {
            return customerAlsoViewedList.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.bookImagesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookImages_cell", for: indexPath) as! ImagesInBookDetailCollectionViewCell
            let bookImage = bookImages[indexPath.row]
            print(indexPath.row)
            cell.bookImages.image = bookImage
            return cell
        }else if collectionView == self.otherSellersCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "othersellers_cell", for: indexPath) as! SuggestionCollectionViewCell
            let book = otherSellersSuggestionList[indexPath.row]
            cell.bookCoverImage.image = book.bookCover
            cell.sellerName.text = book.sellerName
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customeralsoviewed_cell", for: indexPath) as! SuggestionCollectionViewCell
            let book = customerAlsoViewedList[indexPath.row]
            cell.bookCoverImage.image = book.bookCover
            cell.sellerName.text = book.sellerName
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.height - ( collectionView.frame.height / 2 )
        return CGSize(width: width, height: height)
    }


    @IBAction func btnBuynow(_ sender: Any) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "buyNowVC") as! BuyNowViewController
        navigationController?.pushViewController(VC, animated: true)
    }
}

struct sellersSuggestion {
    let bookCover : UIImage
    let sellerName : String
}
