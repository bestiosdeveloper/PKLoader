//
//  PKBallClipRotateAnimation.swift
//
//  Created by Pramod Kumar on 07/09/18.
//  Copyright © 2018 Pramod Kumar. All rights reserved.
//

import UIKit

class PKBallClipRotateAnimation: PKIndicatorAnimationDelegate {
    
    func setUpAnimation(in view: UIView, size: CGSize, color: UIColor) {
        let layer = view.layer
        let duration: CFTimeInterval = 0.75
        
        //    Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.5, 1]
        scaleAnimation.values = [1, 0.6, 1]
        
        // Rotate animation
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        
        rotateAnimation.keyTimes = scaleAnimation.keyTimes
        rotateAnimation.values = [0, Double.pi, 2 * Double.pi]
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, rotateAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw circle
        let circle = PKIndicatorShape.ringThirdFour.layerWith(size: CGSize(width: size.width, height: size.height), color: color)
        let frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
                           y: (layer.bounds.size.height - size.height) / 2,
                           width: size.width,
                           height: size.height)
        
        circle.frame = frame
        circle.add(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
