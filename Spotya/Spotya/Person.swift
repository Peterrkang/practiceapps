//
//  Person.swift
//  Spotya
//
//  Created by Peter Kang on 10/11/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import Foundation


class Person {


    private var _profilePic: String!
    private var _profilePic2: String!
    private var _profilePic3: String!
    private var _summary: String!
    
    var profilePic: String {
        return _profilePic
    }
    
    var profilePic2: String {
        return _profilePic2
    }
    
    var profilePic3: String {
        return _profilePic3
    }

    var summary: String {
        return _summary
    }
    
    init(profilePic: String) {
        _profilePic = profilePic
    }

}
