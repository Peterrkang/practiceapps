//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Peter Kang on 10/13/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation
import CoreData

extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
