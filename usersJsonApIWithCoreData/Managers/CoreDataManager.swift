//
// CoreDataManager.swift
// usersJsonApIWithCoreData
//
// Created by Abdirizak Hassan on 3/23/24. 💻
// Copyright © 2024 Abdirizak Hassan DR X. All Rights Reserved.
//
// GitHub: https://github.com/abdorizak
// Website: https://abdorizak.dev


import Foundation
import UIKit
import CoreData

final class CoreDataManager {
    
    static let share = CoreDataManager()
    private let appDelegate: AppDelegate?
    private let contex: NSManagedObjectContext?
    
    init() {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        contex = appDelegate?.persistentContainer.viewContext
    }
    
    // fetch
    
    
    
    // insert Data
    
    func StoreUsersData(name: String, email: String, completed: @escaping(Result<StoredUsersModel, UsersError>)-> Void) {
        
        
        
    }
    
}
