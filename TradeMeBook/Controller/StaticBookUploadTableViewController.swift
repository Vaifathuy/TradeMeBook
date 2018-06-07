//
//  StaticBookUploadTableViewController.swift
//  TradeMeBook
//
//  Created by Vaifat Huy on 6/7/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class StaticBookUploadTableViewController: UITableViewController {

    @IBOutlet weak var titleCell: UITableViewCell!
    @IBOutlet weak var authorCell: UITableViewCell!
    @IBOutlet weak var ISBNCell: UITableViewCell!
    @IBOutlet weak var langCell: UITableViewCell!
    @IBOutlet weak var genresCell: UITableViewCell!
    
    @IBOutlet weak var genresTextField: UITextField!
    @IBOutlet weak var langTextField: UITextField!
    @IBOutlet weak var ISBNTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellProp([titleCell,authorCell,ISBNCell,langCell,genresCell])
        
    }
    
    private func cellProp(_ cell: [UITableViewCell]){
        for c in cell {
            c.layer.cornerRadius = 16
            c.layer.borderWidth = 1
            c.layer.borderColor = UIColor.orange.cgColor
        }
    }
}
