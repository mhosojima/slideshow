//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 細島誠彦 on 2019/02/14.
//  Copyright © 2019 TransamManegemetnSystem. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var bigImage: UIImageView!
    //受け取るためのプロパティ
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        bigImage.image = image
    }
    
}
