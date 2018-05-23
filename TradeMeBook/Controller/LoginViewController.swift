//
//  LoginViewController.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/23/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    
    let defaultUserName = "admin"
    let defaultPassword = "admin"
    let userDefault = UserDefaults.standard
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        //Register btnLogIn
        btnLogIn.addTarget(self, action: #selector(doLogIn), for: .touchUpInside)
        
    }
    
    private func fetchData(){
        //retrieve data from API
    }
    
    //Handling function to btnLogIn
    @objc func doLogIn(){
        if (txtUserName.text?.contains(defaultUserName))! && (txtPassword.text?.contains(defaultPassword))!{
            userDefault.set(false, forKey: "NoLoggedIn")
            userDefault.synchronize()
            appDelegate.loggedUserName = txtUserName.text!
            appDelegate.loggedPwd = txtPassword.text!
            print("Successfully Logged In")
            performSegue(withIdentifier: "Login-TabBar", sender: nil)
        }else {
            print("Failed to log in...")
            return
        }
    }
    
    
    
}
