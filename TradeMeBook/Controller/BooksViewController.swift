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
    
    var bookList = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        if UserDefaults.standard.isLoggedIn() == true{
            bookTableView.dataSource = self
        }
        
        //Load nib File
        let nibFile = UINib(nibName: "Book_TableCell", bundle: nil)
        bookTableView.register(nibFile, forCellReuseIdentifier: "tableCell_Book")
        
        let book1 = Book(bookID: 1, bookTitle: "Stephen Hawlking", bookCover: "stephen", authorName: "John Green", date: "18-May-18", ISBN: "9182765431231", bookGenres: "Horror,Romance,Novel")
        let book2 = Book(bookID: 2, bookTitle: "Stephen Hawlking", bookCover: "stephen", authorName: "John Green", date: "18-May-18", ISBN: "9182765456231", bookGenres: "Novel,Fiction,Horror")
        let book3 = Book(bookID: 3, bookTitle: "Stephen Hawlking", bookCover: "stephen", authorName: "John Green", date: "18-May-18", ISBN: "9182765439999", bookGenres: "Science,Romance")
        
        bookList.append(book1)
        bookList.append(book2)
        bookList.append(book3)
    }

    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Title / Author / ISBN"
        navigationItem.searchController = searchController
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {    
        let customTableCell = tableView.dequeueReusableCell(withIdentifier: "tableCell_Book") as! BookTableViewCell
        
        customTableCell.bookTitle.text = bookList[indexPath.row].bookTitle
        customTableCell.bookCoverImg.image = UIImage(named: bookList[indexPath.row].bookCover)
        customTableCell.ISBN.text = bookList[indexPath.row].ISBN
        customTableCell.authorName.text = bookList[indexPath.row].authorName
        customTableCell.addedDate.text = bookList[indexPath.row].date
        
        let temp = self.splitString(bookList[indexPath.row].bookGenres)
        if temp.count == 3 {
            customTableCell.genresText_1.isHidden = false
            customTableCell.genresText_2.isHidden = false
            customTableCell.genresText_3.isHidden = false
            customTableCell.genresText_1.text = "\(temp[0])"
            customTableCell.genresText_2.text = "\(temp[1])"
            customTableCell.genresText_3.text = "\(temp[2])"
        }else if temp.count == 2{
            customTableCell.genresText_1.isHidden = false
            customTableCell.genresText_2.isHidden = false
            customTableCell.genresText_3.isHidden = true
            customTableCell.genresText_1.text = "\(temp[0])"
            customTableCell.genresText_2.text = "\(temp[1])"
        }else if temp.count == 1{
            customTableCell.genresText_1.isHidden = false
            customTableCell.genresText_2.isHidden = true
            customTableCell.genresText_3.isHidden = true
            customTableCell.genresText_1.text = "\(temp[0])"
        }
        
        return customTableCell
    }
    
    private func splitString(_ data: String) -> [Substring]{
        return data.split(separator: ",")
    }
    
}
