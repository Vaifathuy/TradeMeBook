//
//  Constant.swift
//  TradeMeBook
//
//  Created by Vaifat Huy on 7/15/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//

import UIKit

struct Constant {
    static let deviceWidth = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
    
    static func stateTextSize() -> CGFloat {
        switch deviceWidth {
        case 320:       //iphone 5
            return 32
        case 375:       //iphone 6, iphone X
            return 36
        case 414:       //iphone 6+
            return 40
        case 768:
            return 43
        default:
            return 36
        }
    }
    
    static func genresTextSize() -> CGFloat{
        switch deviceWidth {
        case 320:       //iphone 5
            return 14
        case 375:       //iphone 6, iphone X
            return 16
        case 414:       //iphone 6+
            return 18
        case 768:
            return 20
        default:
            return 16
        }
    }
}
