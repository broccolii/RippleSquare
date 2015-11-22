//
//  loadingView.swift
//  LatticeAnimationg
//
//  Created by Broccoli on 15/11/22.
//  Copyright © 2015年 Broccoli. All rights reserved.
//

import UIKit

class RippleSquare: UIView {
    
    // 增加一个 间距变量
    private var subLayerArr = [CALayer]()
    init(sideWidth: CGFloat, backgroundColor: UIColor) {
        super.init(frame: CGRect(x: 0, y: 0, width: sideWidth, height: sideWidth))
        
        for i in 0 ..< 9 {
            createLayers(i)
        }
        
        addAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addAnimation() {
        for layer in subLayerArr {
            let animation = CABasicAnimation(keyPath: "transform.scale")
            animation.fromValue = 1
            animation.toValue = 0
            animation.duration = 2.0
            layer.speed = 0
            layer.addAnimation(animation, forKey: nil)
        }
    }
    
    private func createLayers(index: Int) {
        
        let subLayer = CALayer()
        subLayer.backgroundColor = UIColor.blackColor().CGColor
        
        if index < 3 {
            subLayer.frame = CGRect(x: index * 27, y: 0, width: 26, height: 26)
        } else if index < 6 {
            subLayer.frame = CGRect(x: (index - 3) * 27, y: 27, width: 26, height: 26)
        } else {
            subLayer.frame = CGRect(x: (index - 6) * 27, y: 27 * 2, width: 26, height: 26)
        }
        layer.addSublayer(subLayer)
        subLayerArr.append(subLayer)
    }
    
    // 这里的动画 顺序和 原版有一些差别
    // 原版 还有一个翻转
    func animationForPercentage(percent: Double) {
        if percent <= 0.2 {
            subLayerArr.first!.timeOffset = percent / 0.2 * 2.0
            
            subLayerArr[1].timeOffset = percent / 0.2
            subLayerArr[3].timeOffset = percent / 0.2
        } else if percent <= 0.4 {
            subLayerArr[1].timeOffset = 1.0 + (percent - 0.2) / 0.2
            subLayerArr[3].timeOffset = 1.0 + (percent - 0.2) / 0.2
            
            subLayerArr[2].timeOffset = (percent - 0.2) / 0.2
            subLayerArr[4].timeOffset = (percent - 0.2) / 0.2
            subLayerArr[6].timeOffset = (percent - 0.2) / 0.2
            
        } else if percent <= 0.6 {
            subLayerArr[2].timeOffset = 1.0 + (percent - 0.4) / 0.2
            subLayerArr[4].timeOffset = 1.0 + (percent - 0.4) / 0.2
            subLayerArr[6].timeOffset = 1.0 + (percent - 0.4) / 0.2
            
            
            subLayerArr[5].timeOffset = (percent - 0.4) / 0.2
            subLayerArr[7].timeOffset = (percent - 0.4) / 0.2
            
        } else if percent <= 0.8 {
            subLayerArr[5].timeOffset = 1.0 + (percent - 0.6) / 0.2
            subLayerArr[7].timeOffset = 1.0 + (percent - 0.6) / 0.2
            
            subLayerArr.last!.timeOffset = (percent - 0.6) / 0.2
        } else {
            subLayerArr.last!.timeOffset = 1.0 + (percent - 0.8) / 0.2
        }
    }
}
