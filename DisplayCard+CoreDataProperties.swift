//
//  DisplayCard+CoreDataProperties.swift
//  Cowboy Cards!
//
//  Created by Jeremiah Jaylen Pete on 4/23/21.
//
//

import Foundation
import CoreData


extension DisplayCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DisplayCard> {
        return NSFetchRequest<DisplayCard>(entityName: "DisplayCard")
    }

    @NSManaged public var cardDisplay: String?
    @NSManaged public var nextCard: String?
    @NSManaged public var prevCard: String?
    @NSManaged public var titleDisplay: String?
    @NSManaged public var cardData: NSSet?

}

// MARK: Generated accessors for cardData
extension DisplayCard {

    @objc(addCardDataObject:)
    @NSManaged public func addToCardData(_ value: FlashCard)

    @objc(removeCardDataObject:)
    @NSManaged public func removeFromCardData(_ value: FlashCard)

    @objc(addCardData:)
    @NSManaged public func addToCardData(_ values: NSSet)

    @objc(removeCardData:)
    @NSManaged public func removeFromCardData(_ values: NSSet)

}

extension DisplayCard : Identifiable {

}
