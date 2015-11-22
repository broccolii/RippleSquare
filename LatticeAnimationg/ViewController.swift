//
//  ViewController.swift
//  LatticeAnimationg
//
//  Created by Broccoli on 15/11/22.
//  Copyright © 2015年 Broccoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var slider: UISlider!
    var testView: RippleSquare!
    var value = 0.0
    var timer: NSTimer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testView = RippleSquare(sideWidth: 80, backgroundColor: UIColor.blackColor())
        testView.center = CGPoint(x: backView.bounds.width / 2, y: backView.bounds.height / 2)
        backView.addSubview(testView)
       
    }
    
    @IBAction func change(sender: UISlider) {
        testView.animationForPercentage(Double(sender.value))
    }
}

