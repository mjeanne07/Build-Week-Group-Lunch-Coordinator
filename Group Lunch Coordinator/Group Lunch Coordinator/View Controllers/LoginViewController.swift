//
//  LoginViewController.swift
//  Group Lunch Coordinator
//
//  Created by Morgan Smith on 12/19/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userName: UITextField!
    
    @IBAction func joinButton(_ sender: Any) {
        becomeFirstResponder()
        guard let userName = userName.text, userName != "" else {return}
        userController.createUser(withUserName: userName)
    }
 
    
     let userController = UserController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Join" {
        
        guard let destinationVC = segue.destination as? UserTableViewController else { return }
        
       
    }
}
    
}
