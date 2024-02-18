//
//  Presistence.swift
//  CoreDataScratch
//
//  Created by Mehdi on 2024-02-12.
//

import Foundation
import CoreData

struct Persistence{
    static let shared = Persistence()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "PersonModel")
        
        container.loadPersistentStores { (desciption, error) in
            
            if let error = error {
                print("Error loading core data: \(error)")
            } else{
                print("success!")
            }
            
        }
    }
}
