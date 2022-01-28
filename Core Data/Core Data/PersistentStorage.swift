//
//  PersistentStorage.swift
//  Core Data
//
//  Created by Vishal Kamble on 21/12/21.
//

import Foundation
import CoreData

final class PersistentStorage {
    private init(){}
    static let shared = PersistentStorage()
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
    
        let container = NSPersistentContainer(name: "Core_Data")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
        
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext

    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
        
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]?
    {
        do {
            guard let result =  try PersistentStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {
                return nil }
            return result
        } catch let error {
            debugPrint(error)

        }
        return nil
    }
}
