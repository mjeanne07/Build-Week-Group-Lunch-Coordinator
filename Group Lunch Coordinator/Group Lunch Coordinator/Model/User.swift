//
//  User.swift
//  Group Lunch Coordinator
//
//  Created by Morgan Smith on 12/19/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//


//Restaurant selection: chillis, pf changs, california pizza kitchen, cheesecake factory, Yard house

import Foundation

struct User: Equatable, Codable {
    var userName: String
    var lunchTime: Bool //false = early lunch
    var restaurantSelection: String
    
    init(userName: String, lunchTime: Bool = false, restaurantSelection: String = "No selection" ) {
        self.userName = userName
        self.lunchTime = lunchTime
        self.restaurantSelection = restaurantSelection
    }
}
