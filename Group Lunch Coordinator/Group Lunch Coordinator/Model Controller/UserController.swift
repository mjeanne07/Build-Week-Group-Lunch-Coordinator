//
//  UserController.swift
//  Group Lunch Coordinator
//
//  Created by Morgan Smith on 12/19/19.
//  Copyright © 2019 Morgan Smith. All rights reserved.
//

import Foundation

class UserController {
    
    init() {
        loadFromPersistentStore()
    }
    
    
    var users: [User] =
        [User(userName: "Rob"),
         User(userName: "Kate"),
         User(userName: "Lucy")]
    
    func createUser(withUserName userName: String) {
        let newUser = User(userName: userName)
        
        users.append(newUser)
        
        saveToPersistentStore()
    }
    
    func updateSelection(user: User, withRestaurantSelection restaurantSelection: String) {
        guard let index = users.firstIndex(of: user) else { return }
        
        var scratch = user
        scratch.restaurantSelection = restaurantSelection
        users.remove(at: index)
        users.insert(scratch, at: index)
        saveToPersistentStore()
    }
    
    func updateLunchTime(for theUser: User) {
        guard let index = users.firstIndex(of: theUser) else {return}
        users[index].lunchTime = !users[index].lunchTime
        saveToPersistentStore()
    }
    
    var earlyUsers: [User] {
        return users.filter({ $0.lunchTime == false })
    }
    
    var lateUsers: [User] {
        return users.filter({ $0.lunchTime })
    }
    
    func delete(user: User) {
        guard let index = users.firstIndex(of: user) else { return }
        
        users.remove(at: index)
        
        saveToPersistentStore()
    }
    
    
    private func loadFromPersistentStore() {
        
        do {
            guard let fileURL = usersListURL else { return }
            
            let notebooksData = try Data(contentsOf: fileURL)
            
            let plistDecoder = PropertyListDecoder()
            
            self.users = try plistDecoder.decode([User].self, from: notebooksData)
        } catch {
            NSLog("Error decoding memories from property list: \(error)")
        }
    }
    
    private func saveToPersistentStore() {
        
        let plistEncoder = PropertyListEncoder()
        
        do {
            let notebooksData = try plistEncoder.encode(users)
            
            guard let fileURL = usersListURL else { return }
            
            try notebooksData.write(to: fileURL)
        } catch {
            NSLog("Error encoding memories to property list: \(error)")
        }
    }
    
    private var usersListURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let fileName = "UsersList.plist"
        
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
}

