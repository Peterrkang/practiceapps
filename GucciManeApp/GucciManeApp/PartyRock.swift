//
//  PartyRock.swift
//  GucciManeApp
//
//  Created by Peter Kang on 10/11/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation

class PartyRock{
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!
    
    var imageUrl: String {
        return _imageURL
    }
    
    var videoTitle: String {
        return _videoTitle
    }
    
    var videoURL: String{
        return _videoURL
    }
    
    init(imageURL: String, videoURL: String, videoTitle: String){
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }


}
