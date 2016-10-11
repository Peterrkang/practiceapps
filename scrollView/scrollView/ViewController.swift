//
//  ViewController.swift
//  scrollView
//
//  Created by Peter Kang on 10/10/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var images = [UIImageView]()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 0...2 {
        
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = view.frame.midX + view.frame.size.width * CGFloat(x)
            
            scrollView.addSubview(imageView)
        }
        
        print("Count: \(images.count)")
        
    }



}

