//
//  RestaurauntTableViewController.swift
//  Group Lunch Coordinator
//
//  Created by SenorLappy on 23/12/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

//Restaurant selection: chillis, pf changs, california pizza kitchen, cheesecake factory, Yard house


import UIKit

class RestaurauntTableViewController: UITableViewController {
    
    var restaurants: [Restaurant] = [Restaurant(name: "PF Changs", details: "P.F. Chang's Details", selected: false),
                                     Restaurant(name: "Chillis", details: "Chillis Details",selected: false),
                                     Restaurant(name: "California pizza kitchen", details: "CPK Details", selected: false),
                                     Restaurant(name: "Cheesecake Factory", details: "Cheesecake Factory Details", selected: false),
                                     Restaurant(name: "Yard House", details: "Yard House Details", selected: false)]
    

    //outlet tableView

    @IBOutlet var restTableView: UITableView!
    
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
        let restaurant = restaurants[indexPath.row]
        cell.restaurantNameLbl.text = restaurant.name
        cell.restaurantDetailLbl.text = restaurant.details
        cell.selectUnselectBtn.isSelected = restaurant.selected
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //where are we going?
        if segue.identifier == "ShowRestaurauntDetail" {
       
        // what information is being passed?
            if let indexPath = tableView.indexPathForSelectedRow,
                let ResturauntDetailVC = segue.destination as? RestaurantDetailsViewController {
                let restauraunt = restaurants[indexPath.row]
                ResturauntDetailVC.cellRestName = restauraunt
            }
        }
    }
}

//extension RestaurauntTableViewController: RestaurantTableViewCellDelegate {
//    func toggleHasBeenSelected(for cell: RestaurauntTableViewCell) {
//        guard let indexPath = tableView.indexPath(for: cell) else { return }
//        cell.delegate = self
//        tableView.reloadData()
//    }
//
//}


 
