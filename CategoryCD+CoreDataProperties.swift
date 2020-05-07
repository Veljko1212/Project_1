//
//  CategoryCD+CoreDataProperties.swift
//  Hangman
//
//  Created by Veljko Milosevic on 07/05/2020.
//  Copyright © 2020 Veljko Milosevic. All rights reserved.
//
//

import Foundation
import CoreData


extension CategoryCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryCD> {
        return NSFetchRequest<CategoryCD>(entityName: "CategoryCD")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: Data?
    @NSManaged public var words: NSSet?

}

// MARK: Generated accessors for words
extension CategoryCD {

    @objc(addWordsObject:)
    @NSManaged public func addToWords(_ value: WordCD)

    @objc(removeWordsObject:)
    @NSManaged public func removeFromWords(_ value: WordCD)

    @objc(addWords:)
    @NSManaged public func addToWords(_ values: NSSet)

    @objc(removeWords:)
    @NSManaged public func removeFromWords(_ values: NSSet)

}
