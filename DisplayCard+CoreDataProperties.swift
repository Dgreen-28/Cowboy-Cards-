//
//  DisplayCard+CoreDataProperties.swift
//  Cowboy Cards!
//
//  Created by Jeremiah Jaylen Pete on 4/28/21.
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

}

extension DisplayCard : Identifiable {

}
