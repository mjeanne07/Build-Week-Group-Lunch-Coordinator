//
//  UserTableViewController.swift
//  Group Lunch Coordinator
//
//  Created by Morgan Smith on 12/22/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController, UserTableViewCellDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        showAlert()
        
    }
    private func showAlert() {
        
        let alert = UIAlertController(title: "Time For Lunch", message: "Get ready for lunch at x location, leaving in 15 min.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func userFor(indexPath: IndexPath) -> User {
          if indexPath.section == 0 {
              return userController.earlyUsers[indexPath.row]
          } else {
              return userController.lateUsers[indexPath.row]
          }
      }
    
    func toggleLunchTime(cell: UserTableViewCell) {
        guard let theIndexPath = tableView.indexPath(for: cell) else {return}
        let user = userFor(indexPath: theIndexPath)
        userController.updateLunchTime(for: user)
        tableView.reloadData()
    }
    
    var userController = UserController()
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
           if section == 0 {
                 return userController.earlyUsers.count
             } else {
                return userController.lateUsers.count
             }
    }
    
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
        
        cell.delegate = self
        
        let user = userFor(indexPath: indexPath)
        
        cell.user = user
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            guard userController.earlyUsers.count > 0 else { return nil }
            return "Early Lunch"
        } else {
            guard userController.lateUsers.count > 0 else { return nil }
            return "Late Lunch"
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let user = userFor(indexPath: indexPath)
            
            userController.delete(user: user)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
