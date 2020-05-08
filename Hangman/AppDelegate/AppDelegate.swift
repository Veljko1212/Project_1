//
//  AppDelegate.swift
//  Hangman
//
//  Created by Veljko Milosevic on 06/05/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let coreDataStack = CoreDataStack(modelName: "Hangman")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let categories = loadJson(from: "Categories", ofType: "json")
        saveJsonToCoreData(toSave: categories)
        GameStorage.shared.categories = coreDataStack.fetch(object: CategoryCD.self)
        return true
    }
    
    func loadJson(from fileName:String , ofType type:String) -> [Category] {
        if let path = Bundle.main.path(forResource: fileName, ofType: type) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return try JSONDecoder().decode([Category].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
        return []
    }
    
    func saveJsonToCoreData(toSave categoryArray:[Category]) {
        
        let fetchRequest: NSFetchRequest<CategoryCD> = CategoryCD.fetchRequest()
        let count = try! coreDataStack.managedContext.count(for: fetchRequest)
        
        if count > 0 {
            return
        }
       
        for category in categoryArray {
            let categoryCD = CategoryCD(context: coreDataStack.managedContext)
            categoryCD.name = category.name
            categoryCD.image = UIImage(named: category.image)?.pngData()
            
            let words = categoryCD.words?.mutableCopy() as? NSMutableSet
            
            for word in category.words {
                let item = WordCD(context: coreDataStack.managedContext)
                item.title = word.title
                item.uniqueCount = word.uniqueCount
                item.hidden = word.hidden
                
                words?.add(item)
                
            }
           categoryCD.words = words
        }
        
        coreDataStack.saveContext()
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

