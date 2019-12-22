//
//  UserTableViewCellDelegate.swift
//  Group Lunch Coordinator
//
//  Created by Morgan Smith on 12/22/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import Foundation

protocol UserTableViewCellDelegate: class {
    func toggleLunchTime(cell: UserTableViewCell)
}
