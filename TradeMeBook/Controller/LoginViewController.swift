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
    
    @IBAction func btnClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    private func fetchData(){
        //retrieve data from API
    }
    
    //Handling function to btnLogIn
    @objc func doLogIn(){
        if (txtUserName.text?.contains(defaultUserName))! && (txtPassword.text?.contains(defaultPassword))!{
            UserDefaults.standard.setIsLoggedIn(value: true)
            print("Successfully Logged In")
            performSegue(withIdentifier: "Login-TabBar", sender: nil)
        }else {
            showMessage(title: "Log in failed", msg: "Incorrect username or password")
            print("Failed to log in...")
            return
        }
    }
    
    private func showMessage(title: String, msg: String){
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
