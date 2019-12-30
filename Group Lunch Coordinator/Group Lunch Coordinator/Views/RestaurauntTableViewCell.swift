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
   weak var selectionDelegate: RestaurantSelectionDelegate?
    
    
    //IB Outlets
    
    @IBOutlet weak var restaurantNameLbl: UILabel!
    @IBOutlet weak var restaurantDetailLbl: UILabel!
    @IBOutlet weak var selectUnselectBtn: UIButton!
    
    @IBAction func selectionTapped(_ sender: Any) {
        selectionDelegate?.changeSelection(cell: self)
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
