//
//  RestaurauntTableViewController.swift
//  Group Lunch Coordinator
//
//  Created by SenorLappy on 23/12/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

class RestaurauntTableViewController: UITableViewController {
    
    //outlet tableView

    @IBOutlet var restTableView: UITableView!
    
    var restaurants: [Restaurant] = [Restaurant(name: "PF Changs", details: "P.F. Chang's offers authentic Chinese food & Asian cuisine in a casual dining atmosphere")]
       
    override func viewDidLoad() {
//        self.restTableView.delegate = self
//        self.restTableView.dataSource = self
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    override func tableView(_ restTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurauntCell", for: indexPath) as? RestaurauntTableViewCell else { return UITableViewCell() }
        let restaurant = restaurants
        return cell
    }
   
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension RestaurauntTableViewController: RestaurantTableViewCellDelegate {
//    func toggleHasBeenSelected(for cell: RestaurauntTableViewCell) {
//        guard let indexPath = tableView.indexPath(for: cell) else { return }
//        cell.delegate = self
//        tableView.reloadData()
//    }
//
//}


 
