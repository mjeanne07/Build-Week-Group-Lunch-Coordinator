//
//  UserTableViewCell.swift
//  Group Lunch Coordinator
//
//  Created by Morgan Smith on 12/22/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

     weak var delegate: UserTableViewCellDelegate?
    
    func updateViews() {
        guard let user = user else { return }
        
        userName.text = user.userName
        if user.lunchTime == false {
            lunchTimeLabel.setTitle("Early", for: .normal)
        } else {
            lunchTimeLabel.setTitle("Late", for: .normal)
        }
        restaurantSelection.text = user.restaurantSelection
    }
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var restaurantSelection: UILabel!
    @IBOutlet weak var lunchTimeLabel: UIButton!
    
    @IBAction func changeLunchTime(_ sender: UIButton) {
        delegate?.toggleLunchTime(cell: self)
    }
   
    @IBAction func selectRestaurant(_ sender: UIButton) {
    }
    
     var user: User? {
         didSet {
             updateViews()
         }
     }
    


}
