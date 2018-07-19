//
//  BuyNowViewController.swift
//  TradeMeBook
//
//  Created by Vaifat Huy on 7/18/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class BuyNowViewController: UIViewController {

    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var seller: UILabel!
    @IBOutlet weak var ISBN: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var ISBNLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateTagLabel: UILabel!
    @IBOutlet weak var priceTagLabel: UILabel!
    @IBOutlet weak var bookTypeLabel: UILabel!
    @IBOutlet weak var bookTypeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        HeaderView.layer.borderColor = UIColor.orange.cgColor
        HeaderView.layer.borderWidth = 1.0
        HeaderView.layer.cornerRadius = 22.0
        
        bookTypeView.layer.borderColor = UIColor.orange.cgColor
        bookTypeView.layer.borderWidth = 1.0
        bookTypeView.layer.cornerRadius = 18.0
        bindData()
        dynamicTextSizeWithRegularFont(label: [titleLabel,ISBNLabel,sellerLabel,qtyLabel])
        dynamicTextSizeWithBoldFont(label: [bookTitle,ISBN,seller,qty,bookTypeLabel])
        priceTagLabel.font = UIFont.boldSystemFont(ofSize: Constant.stateTextSize())
        stateTagLabel.font = UIFont.boldSystemFont(ofSize: Constant.stateTextSize())
    }
    
    func bindData(){
        let justDate = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
        let justTime = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        dateLabel.text = justDate
        timeLabel.text = justTime
        print("\(justDate)")
        titleLabel.text = "The fault in our star"
        ISBNLabel.text = "7654389761203"
        sellerLabel.text = "Helen Yong"
        qtyLabel.text = "1"
        bookTypeLabel.text = "Paperback"
        priceTagLabel.text = "11$"
        stateTagLabel.text = "NEW"
        bookCover.image = UIImage(named: "thefaultinourstar")
    }
    
    func setupNavBar(){
        navigationItem.title = "Checkout"
    }
    
    func dynamicTextSizeWithRegularFont(label: [UILabel]){
        for l in label {
            l.font = UIFont.systemFont(ofSize: Constant.buyNowViewTextSize())
        }
    }
    
    func dynamicTextSizeWithBoldFont(label: [UILabel]){
        for l in label {
            l.font = UIFont.boldSystemFont(ofSize: Constant.buyNowViewTextSize())
        }
    }
    
    @IBAction func btnIncrease(_ sender: Any) {
    }
    
    @IBOutlet weak var btnDecrease: UIButton!
}
