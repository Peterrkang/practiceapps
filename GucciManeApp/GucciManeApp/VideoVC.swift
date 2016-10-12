//
//  VideoVC.swift
//  GucciManeApp
//
//  Created by Peter Kang on 10/11/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock{
        get {
            return _partyRock
        }set {
            _partyRock = newValue
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(partyRock)
        videoTitleLabel.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        // Do any additional setup after loading the view.
    }



}
