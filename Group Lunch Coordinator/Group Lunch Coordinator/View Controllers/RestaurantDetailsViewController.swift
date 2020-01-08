//
//  RestaurantDetailsViewController.swift
//  Group Lunch Coordinator
//
//  Created by SenorLappy on 24/12/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
          guard let cellRestName = cellRestName else {return}
          restName.text = cellRestName.name
          restLocation.text = cellRestName.location
          restNumber.text = cellRestName.phone
          restType.text = cellRestName.type
          
      }
    
    var cellRestName: Restaurant?
    
    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var restLocation: UILabel!
    @IBOutlet weak var restNumber: UILabel!
    @IBOutlet weak var restType: UILabel!


}
