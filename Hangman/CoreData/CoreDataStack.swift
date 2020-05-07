//
//  CoreDataStack.swift
//  Hangman
//
//  Created by Veljko Milosevic on 07/05/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import CoreData


class CoreDataStack {
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext () {
        guard managedContext.hasChanges else { return }
        
        do {
            try managedContext.save()
        } catch let nserror as NSError {
            print("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func fetch<T:NSManagedObject>(object:T.Type) -> [T] {
        let fetchRequest = T.fetchRequest()
        let sort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        do {
            let result = try managedContext.fetch(fetchRequest) as! [T]
            return result
        }
        catch{}
        return []
    }
}
