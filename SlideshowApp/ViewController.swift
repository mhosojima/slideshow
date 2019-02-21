//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 細島誠彦 on 2019/02/13.
//  Copyright © 2019 TransamManegemetnSystem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UIImageView: UIImageView!
    
    @IBAction func onTapimage(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のNextViewControllerを取得する
        let nextViewController:NextViewController = segue.destination as! NextViewController
        // 遷移先のNextViewControllerで宣言しているbigImageに値を代入して渡す
        nextViewController.image = images[imageIndex]
        if timer != nil {
        timer.invalidate()
        timer = nil
        }
    }
    
    var imageIndex = 0
    
    var timer : Timer!
    
    let images = [UIImage(named: "thumb_1027.jpg"), UIImage(named: "thumb_1030.jpg"), UIImage(named: "thumb_1044.jpg")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageView = images[0]
        
        UIImageView.image = imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backImage(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        UIImageView.image = images[imageIndex]
    }
    
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
    }

    @IBOutlet weak var nextImage: UIButton!
    @IBOutlet weak var backImage: UIButton!
    
    @IBAction func startStop(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            nextImage.isEnabled = false
            backImage.isEnabled = false
        }
        else {
            self.timer.invalidate()
            self.timer = nil
            nextImage.isEnabled = true
            backImage.isEnabled = true
        }
    }
    
    @objc func onTimer(_ timer: Timer) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}

