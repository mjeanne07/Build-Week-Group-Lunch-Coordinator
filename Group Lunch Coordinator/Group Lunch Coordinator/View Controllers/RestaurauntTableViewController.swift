//
//  RestaurauntTableViewController.swift
//  Group Lunch Coordinator
//
//  Created by SenorLappy on 23/12/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

//Restaurant selection: chillis, pf changs, california pizza kitchen, cheesecake factory, Yard house


import UIKit

class RestaurauntTableViewController: UITableViewController, RestaurantSelectionDelegate {
    
    override func viewDidLoad() {
        //        self.restTableView.delegate = self
        //        self.restTableView.dataSource = self
        super.viewDidLoad()
    }

    
    var user: User?
    var signedInUser: User?
    let userController = UserController.shared

    
    var restaurants: [Restaurant] = [Restaurant(name: "PF Changs", details: "P.F. Chang's Details", selected: false, location: "Port Imperial Blvd, NY", phone: "(201) 866-7790", type: "Creative Chinese fare", image: UIImage(named: "pfchang.jpg")!),
                                     Restaurant(name: "Chillis", details: "Chillis Details",selected: false, location: "Glendale, NY", phone: "(718) 366-4272", type: "Classic Tex-Mex and American fare", image: UIImage(named: "chillis.png")!),
                                     Restaurant(name: "California Pizza Kitchen", details: "CPK Details", selected: false, location: "Atlas Park, NY", phone: "(718) 894-9400", type: "Inventive pizza, pasta, and salad", image: UIImage(named: "cpk.jpg")!),
                                     Restaurant(name: "Cheesecake Factory", details: "Cheesecake Factory Details", selected: false, location: "Queens Blvd, NY", phone: "(718) 699-1212", type: "American fare and signature cheesecakes", image: UIImage(named: "cheesecake.jpg")!),
                                     Restaurant(name: "Yard House", details: "Yard House Details", selected: false, location: "Yonkers, NY", phone: "(914) 375-9273", type: "Sports-bar with American fare and craft beer", image: UIImage(named: "yardhouse.png")!)]
    
    
    func changeSelection(cell: RestaurauntTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        
        let restaurant = restaurants[indexPath.row]
        
        let restaurantSelection = restaurant.name
        
        userController.updateSelection(user: user!, withRestaurantSelection: restaurantSelection)
    }
    
    //outlet tableView
    
    @IBOutlet var restTableView: UITableView!
    
    
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
        
        cell.selectionDelegate = self
        cell.signedInUser = signedInUser
        cell.user = user
        let restaurant = restaurants[indexPath.row]
        cell.restaurantNameLbl.text = restaurant.name
        cell.restaurantDetailLbl.text = restaurant.details
        //        cell.selectUnselectBtn.isSelected = restaurant.selected
        return cell
    }
    
    
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
    
    // IB ACTION Save Btn
    @IBAction func saveSelectionBtnPressed(_ sender: UIBarButtonItem) {
        
navigationController?.popViewController(animated: true)
    }
    
}





