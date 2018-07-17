//
//  BookTableViewCell.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/28/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell{
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookCoverImg: UIImageView!
    @IBOutlet weak var addedDate: UILabel!
    @IBOutlet weak var ISBN: UILabel!
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var genresText_1: UITextField!
    @IBOutlet weak var genresText_2: UITextField!
    @IBOutlet weak var genresText_3: UITextField!
    var genresNumber: Int = 0
    
    var genresTextField : UITextField {
       let textField = UITextField()
        textField.placeholder = "Default"
        textField.layer.cornerRadius = 25.0
        textField.layer.borderWidth = 0.75
        textField.layer.borderColor = UIColor.orange.cgColor
        return textField
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted == true {
            self.backgroundColor = UIColor.orange
        }else {
            self.backgroundColor = UIColor.white
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupGenresTextField()
        
    }
    private func setupGenresTextField(){
        genresText_1.layer.cornerRadius = 16.0
        genresText_2.layer.cornerRadius = 16.0
        genresText_3.layer.cornerRadius = 16.0
        bgView.layer.cornerRadius = 30
        
        genresText_1.borderStyle = UITextBorderStyle.none
        genresText_2.borderStyle = UITextBorderStyle.none
        genresText_3.borderStyle = UITextBorderStyle.none
        
        genresText_1.layer.borderWidth = 1
        genresText_2.layer.borderWidth = 1
        genresText_3.layer.borderWidth = 1
        bgView.layer.borderWidth = 0.75
        
        genresText_1.layer.borderColor = UIColor.orange.cgColor
        genresText_2.layer.borderColor = UIColor.orange.cgColor
        genresText_3.layer.borderColor = UIColor.orange.cgColor
        bgView.layer.borderColor = UIColor.orange.cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected == false {
            selectionStyle = .none
        }
    }
}
