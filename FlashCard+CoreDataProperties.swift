//
//  FlashCard+CoreDataProperties.swift
//  Cowboy Cards!
//
//  Created by Jeremiah Jaylen Pete on 4/23/21.
//
//

import Foundation
import CoreData


extension FlashCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FlashCard> {
        return NSFetchRequest<FlashCard>(entityName: "FlashCard")
    }

    @NSManaged public var storeAnswer: String?
    @NSManaged public var storeCardNum: Int32
    @NSManaged public var storeQuestion: String?
    @NSManaged public var storeTitle: String?
    @NSManaged public var displayData: NSSet?

}

// MARK: Generated accessors for displayData
extension FlashCard {

    @objc(addDisplayDataObject:)
    @NSManaged public func addToDisplayData(_ value: DisplayCard)

    @objc(removeDisplayDataObject:)
    @NSManaged public func removeFromDisplayData(_ value: DisplayCard)

    @objc(addDisplayData:)
    @NSManaged public func addToDisplayData(_ values: NSSet)

    @objc(removeDisplayData:)
    @NSManaged public func removeFromDisplayData(_ values: NSSet)

}

extension FlashCard : Identifiable {

}
