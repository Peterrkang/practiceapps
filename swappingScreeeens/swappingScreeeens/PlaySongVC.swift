//
//  PlaySongVC.swift
//  swappingScreeeens
//
//  Created by Peter Kang on 10/10/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit

class PlaySongVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SongTitle.text = selectedSong
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var SongTitle: UILabel!
    
    private var _selectedSong: String!
    
    var selectedSong: String {
        get {
            return _selectedSong
        } set {
            _selectedSong = newValue
        }
    }

  
}
