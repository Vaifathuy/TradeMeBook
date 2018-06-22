//
//  MoreViewController.swift
//  TradeMeBook
//
//  Created by Vaifat Huy on 6/22/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    @IBOutlet weak var versionView: UIView!
    @IBOutlet weak var ourTeamTextView: UITextView!
    @IBOutlet weak var ourProjectTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCustomNavBar()
        ourTeamTextView.layer.cornerRadius = 16.0
        ourTeamTextView.layer.borderColor = UIColor.orange.cgColor
        ourTeamTextView.layer.borderWidth = 1
        
        ourProjectTextView.layer.cornerRadius = 16.0
        ourProjectTextView.layer.borderColor = UIColor.orange.cgColor
        ourProjectTextView.layer.borderWidth = 1
        
        versionView.layer.cornerRadius = 16.0
        versionView.layer.borderColor = UIColor.orange.cgColor
        versionView.layer.borderWidth = 1
        
    }
    
    func initCustomNavBar(){
        self.navigationItem.title = "About Us"
    }
}

