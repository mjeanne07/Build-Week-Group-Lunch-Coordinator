//
//  RestaurauntTableViewCell.swift
//  Group Lunch Coordinator
//
//  Created by SenorLappy on 23/12/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

class RestaurauntTableViewCell: UITableViewCell {
    
    var delegate: RestaurantTableViewCellDelegate?
    var selectionDelegate: RestaurantSelectionDelegate?
    let userController = UserController.shared
    var user: User?
    
    //IB Outlets
    
    @IBOutlet weak var restaurantNameLbl: UILabel!
    @IBOutlet weak var restaurantDetailLbl: UILabel!
    @IBOutlet weak var selectUnselectBtn: UIButton!
    
    @IBAction func selectionTapped(_ sender: Any) {
           guard let restaurantSelectionLabel = restaurantNameLbl.text,
            let user = userController.signedInUser else {return}
           
        userController.updateSelection(user: user, withRestaurantSelection: restaurantSelectionLabel)
    }
    

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    

}
