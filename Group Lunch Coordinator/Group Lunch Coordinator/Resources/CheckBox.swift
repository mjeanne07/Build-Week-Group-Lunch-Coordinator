//
//  CheckBox.swift
//  Group Lunch Coordinator
//
//  Created by Sal Amer on 25/12/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

//setup images
    let checkedImage = UIImage(named: "checked")
    let unCheckedImage = UIImage(named: "unchecked")
    
    //bool value for box
    @IBInspectable var isChecked:Bool = false {
        didSet{
            self.updateImage()
        }
    }
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(CheckBox.buttonClicked), for: UIControl.Event.touchUpInside)
        self.updateImage()
        
    }
    func updateImage() {
            if isChecked == true {
                setImage(checkedImage, for: [])
            } else {
                setImage(unCheckedImage, for: [])
            }
        }
    @objc func buttonClicked(sender: UIButton) {
        if(sender == self) {
            isChecked = !isChecked
        }
    }
}
