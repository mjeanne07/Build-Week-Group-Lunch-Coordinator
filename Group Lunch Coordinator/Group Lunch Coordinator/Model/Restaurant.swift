//
//  Restaurants.swift
//  Group Lunch Coordinator
//
//  Created by SenorLappy on 23/12/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//
//Restaurant selection: chillis, pf changs, california pizza kitchen, cheesecake factory, Yard house

import UIKit

struct Restaurant {
    //removed codable
    var name: String
    var details: String
    var selected: Bool
    var location: String
    var phone: String
    var type: String
    let image: UIImage

    
    init(name: String, details: String, selected: Bool = false, location: String, phone: String, type: String, image: UIImage) {
        self.name = name
        self.details = details
        self.selected = selected
        self.location = location
        self.phone = phone
        self.type = type
        self.image = image
    }
}

