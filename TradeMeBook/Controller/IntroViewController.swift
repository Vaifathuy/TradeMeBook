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
        //Register a handling function for the button 'btnGetStarted'
        btnGetStarted.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
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
    
    //Handling function for the button 'btnGetStarted'
    @objc func btnClicked() {
        UserDefaults.standard.setOnboardingCompleted(value: true)
    }

    
}
