//
//  MainTabBarViewController.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/23/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController{

    @IBOutlet weak var customTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if UserDefaults.standard.isLoggedIn() == false{
            if item.title == "Books" || item.title == "Account"{
                performSegue(withIdentifier: "segue_login", sender: nil)
            }
        }
    }

}
