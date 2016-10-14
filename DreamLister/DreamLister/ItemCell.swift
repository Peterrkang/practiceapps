//
//  ItemCell.swift
//  DreamLister
//
//  Created by Peter Kang on 10/13/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    func configureCell(item: Item) {
        
        title.text = item.title
        detail.text = item.details
        price.text = "$\(item.price)"
        
    
    }
    
}
