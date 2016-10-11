//
//  MusicListVC.swift
//  swappingScreeeens
//
//  Created by Peter Kang on 10/10/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit

class MusicListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }

    
    @IBAction func backBtn(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func thirdScreenBtn(_ sender: AnyObject) {
        let songTitle = "Star Boy"
        performSegue(withIdentifier: "PlaySongVC", sender: songTitle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaySongVC {
            
            if let song = sender as? String{
                destination.selectedSong = song
            }
        }
    }
    
    
}
