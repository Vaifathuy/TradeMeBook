//
//  GenresCollectionViewCell.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/29/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var txtGenres: UITextField!
    
    override func awakeFromNib() {
        txtGenres.layer.cornerRadius = txtGenres.frame.height / 2
        txtGenres.layer.borderColor = UIColor.orange.cgColor
    }
}
