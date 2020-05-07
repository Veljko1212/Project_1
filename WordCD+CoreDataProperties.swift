//
//  WordCD+CoreDataProperties.swift
//  Hangman
//
//  Created by Veljko Milosevic on 07/05/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//
//

import Foundation
import CoreData


extension WordCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordCD> {
        return NSFetchRequest<WordCD>(entityName: "WordCD")
    }

    @NSManaged public var hidden: String?
    @NSManaged public var title: String?
    @NSManaged public var uniqueCount: Int16
    @NSManaged public var category: CategoryCD?

}
