//
//  BuyNowViewController.swift
//  TradeMeBook
//
//  Created by Vaifat Huy on 7/18/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class BuyNowViewController: UIViewController {

    @IBOutlet weak var checkoutPinTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var deliveryInfoView: UIView!
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
        decorateView(for: [HeaderView,deliveryInfoView], borderWidth: 1.0, borderRadius: 22.0)
        decorateView(for: [bookTypeView], borderWidth: 1.0, borderRadius: 18.0)
        decorateView(for: [addressTextField,contactTextField,checkoutPinTextField], borderWidth: 1.0, borderRadius: 16.0)
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
    
    func decorateView(for views: [UIView], borderWidth: CGFloat, borderRadius: CGFloat){
        for view in views {
            view.layer.borderColor = UIColor.orange.cgColor
            view.layer.borderWidth = borderWidth
            view.layer.cornerRadius = borderRadius
        }
    }
    
    
    @IBAction func btnBuy(_ sender: Any) {
    }
    
    @IBAction func btnIncrease(_ sender: Any) {
    }
    
    @IBOutlet weak var btnDecrease: UIButton!
}
