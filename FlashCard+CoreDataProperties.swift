//
//  FlashCard+CoreDataProperties.swift
//  Cowboy Cards!
//
//  Created by Jeremiah Jaylen Pete on 4/28/21.
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
    @NSManaged public var storeQuestionArray: [String]?
    @NSManaged public var storeAnswerArray: [String]?

}

extension FlashCard : Identifiable {

}
