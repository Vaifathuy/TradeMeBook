//
//  IntroViewController.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/19/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var btnGetStarted: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.6, animations: {
            self.btnGetStarted.alpha = 1
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 0.6) {
            self.btnGetStarted.alpha = 0
        }
    }
    

}
