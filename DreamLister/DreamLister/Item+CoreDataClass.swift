//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Peter Kang on 10/13/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate()
    }
    
    
    
    
}
