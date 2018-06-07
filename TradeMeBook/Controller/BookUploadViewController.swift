//
//  BookUploadViewController.swift
//  TradeMeBook
//
//  Created by Vaifat Huy on 6/7/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class BookUploadViewController: UIViewController{
    
    @IBOutlet weak var descLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        descLabel.layer.borderColor = UIColor.orange.cgColor
        descLabel.layer.borderWidth = 1
        descLabel.layer.cornerRadius = 16
        
    }
    
    @IBAction func doneButton(_ sender: Any) {
        print("pressed--DONE")
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        print("pressed--Cancel")
        self.dismiss(animated:true, completion: nil)
    }
}
