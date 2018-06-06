//
//  SignUpViewController.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/27/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtConfirmPwd: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func gestureManagement() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gestureHandler(sender:)))
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func gestureHandler(sender: UITapGestureRecognizer){
        if sender.numberOfTapsRequired == 1{
            if txtUserName.isEditing == true {
                txtUserName.resignFirstResponder()
            }else if txtEmail.isEditing == true {
                txtEmail.resignFirstResponder()
            }else if txtPassword.isEditing == true {
                txtPassword.resignFirstResponder()
            }else if txtConfirmPwd.isEditing == true {
                txtConfirmPwd.resignFirstResponder()
            }
        }
    }
    
    @IBAction func buttonSignUp(_ sender: Any) {
        
    }
}
