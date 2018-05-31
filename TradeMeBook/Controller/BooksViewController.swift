//
//  BooksViewController.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/29/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController, UITableViewDataSource{

    @IBOutlet weak var bookTableView: UITableView!
    
    //Testing models
    let bookCover = [#imageLiteral(resourceName: "thisisgoingtohurt"),#imageLiteral(resourceName: "stephen"),#imageLiteral(resourceName: "thespace"),#imageLiteral(resourceName: "eleanor"),#imageLiteral(resourceName: "elonmusk"),#imageLiteral(resourceName: "brainfood"),#imageLiteral(resourceName: "thescienceofgettingrich"),#imageLiteral(resourceName: "stevejobs"),#imageLiteral(resourceName: "improveyoursocialskill")]
    let bookTitle = ["This is going to hurt", "Stephen Hawlking", "The Space Barons", "Eleanor","Elonmusk","BrainFoods","The Science of getting rich","Steve Jobs","Improve your social skill"]
    let authorName = ["John Green","John Green","John Green","John Green","John Green","John Green","John Green","John Green","John Green"]
    let date = ["18-May-18","19-May-18","20-May-18","01-June-18","05-June-18","18-June-18","19-June-18","20-June-18","20-June-18"]
    let ISBN = ["9182765431231","8765490123789","0425618791700","9342516789011","9182765431231","9182765431231","9182765431231","9182765431231","9182765431231"]
    let genres = ["Horror,Romance,Novel", "Novel,Romance,Horror","Novel,Romance,Horror","Novel,Romance,Horror","Novel,Romance,Horror","Novel,Romance,Horror","Novel,Romance,Horror","Novel,Romance,Horror","Novel,Romance,Horror"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        if UserDefaults.standard.isLoggedIn() == true{
            bookTableView.dataSource = self
        }
        
        //Load nib File
        let nibFile = UINib(nibName: "Book_TableCell", bundle: nil)
        bookTableView.register(nibFile, forCellReuseIdentifier: "tableCell_Book")
    }

    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Title / Author / ISBN"
        navigationItem.searchController = searchController
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookCover.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {    
        let customTableCell = tableView.dequeueReusableCell(withIdentifier: "tableCell_Book") as! BookTableViewCell
        
        customTableCell.bookTitle.text = bookTitle[indexPath.row]
        customTableCell.bookCoverImg.image = bookCover[indexPath.row]
        customTableCell.ISBN.text = ISBN[indexPath.row]
        customTableCell.authorName.text = authorName[indexPath.row]
        customTableCell.addedDate.text = date[indexPath.row]
        customTableCell.genres = self.genres
        
        return customTableCell
    }
}
