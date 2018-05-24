//
//  UserDefaultExtend.swift
//  TradeMeBook
//
//  Created by Dronya_b on 5/24/18.
//  Copyright © 2018 Vaifathuy. All rights reserved.
//
//  This extension created to help us store data to UserDefaults

import Foundation

extension UserDefaults {
    
    enum UserDefaultKeys: String {
        case isLoggedIn
        case onboardingCompleted
    }
    
    //SetKey Functions
    func setIsLoggedIn(value : Bool) {
        UserDefaults.standard.set(value, forKey: UserDefaultKeys.isLoggedIn.rawValue)
        synchronize()
    }
    func setOnboardingCompleted(value : Bool) {
        UserDefaults.standard.set(value, forKey: UserDefaultKeys.onboardingCompleted.rawValue)
        synchronize()
    }
    
    //GetKey Functions
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultKeys.isLoggedIn.rawValue)
    }
    func onboardingCompleted() -> Bool {
        return bool(forKey: UserDefaultKeys.onboardingCompleted.rawValue)
    }
    
    
}
