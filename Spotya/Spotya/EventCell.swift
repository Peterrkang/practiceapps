//
//  EventCell.swift
//  Spotya
//
//  Created by Peter Kang on 10/11/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(event: Event){
        eventTitle.text = Event.title
        
        let url = URL(string: partyRock.imageUrl)!
        
        DispatchQueue.global().async{
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                //handle error
            }
            
        }
        
    }
}
