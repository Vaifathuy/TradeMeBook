//
//  Book.swift
//  TradeMeBook
//
//  Created by Vaifat Huy on 6/4/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import Foundation

struct Book: Decodable{
    let bId : Int
    let bTitle : String
    let bFCover : [String]?
    let bAuthor : String
    let bAddedDate : String
    let ISBN : String
    let bGenres : String
}
