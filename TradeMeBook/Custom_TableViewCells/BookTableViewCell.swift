//
//  BookTableViewCell.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/28/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var genresCollectionView: UICollectionView!
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookCoverImg: UIImageView!
    @IBOutlet weak var addedDate: UILabel!
    @IBOutlet weak var ISBN: UILabel!
    @IBOutlet weak var authorName: UILabel!
    
    var genres: [String] = ["Novel,Horror,Romance","",""]    //Accept only 3 Genres
    //string format to be append to [genres]: "genres1,genres2,genres3"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellRadius()
        //Register collectionView to datasource and delegate
        genresCollectionView.dataSource = self
        genresCollectionView.delegate = self
        
        //Register nib file - custom collectionView Cell
        let nibFile = UINib(nibName: "GenresCollectionViewCell", bundle: nil)
        self.genresCollectionView.register(nibFile, forCellWithReuseIdentifier: "genres_cell")
    }

    private func setupCellRadius(){
        bgView.layer.cornerRadius = 25.0
        bgView.layer.borderWidth = 0.75
        bgView.layer.borderColor = UIColor.orange.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genres_cell", for: indexPath) as! GenresCollectionViewCell
        if self.genres.isEmpty {
            return cell
        }else {
            let strArr = splitString(data: genres[indexPath.row])
            let subString = strArr[indexPath.row]
            cell.txtGenres.text = "\(subString)"
            return cell
        }
    }
    
    
    
    
    private func splitString(data: String) -> [Substring]{
        return data.split(separator: ",")
    }

}
