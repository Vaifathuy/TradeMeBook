//
//  StaticMoreTableViewController.swift
//  TradeMeBook
//
//  Created by Vaifat Huy on 6/22/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit


class StaticMoreTableViewController: UITableViewController {

    @IBOutlet weak var logoutCell: UITableViewCell!
    @IBOutlet weak var aboutUsCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutCell.selectionStyle = .none
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(aboutUsCellClicked(gesture:)))
        tapGesture.numberOfTapsRequired = 1
        aboutUsCell.addGestureRecognizer(tapGesture)
    }

    @IBAction func btnLogout(_ sender: Any) {
        if UserDefaults.standard.isLoggedIn() == true {
            print("LoggedOut...")
            UserDefaults.standard.setIsLoggedIn(value: false)
            let MainApp = storyboard?.instantiateViewController(withIdentifier: "MainApp")
            self.present(MainApp!, animated: true, completion: {
                //Completion hanlder...
            })
        }else {
            return
        }
    }
    
    @objc func aboutUsCellClicked(gesture: UIGestureRecognizer){
        if gesture.numberOfTouches == 1 {
            let aboutUsVC = storyboard?.instantiateViewController(withIdentifier: "aboutUsVC")
            navigationController?.pushViewController(aboutUsVC!, animated: true)
        }
    }
}
