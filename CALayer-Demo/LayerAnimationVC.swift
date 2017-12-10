//
//  LayerAnimationVC.swift
//  CALayer-Demo
//
//  Created by Pavan Kumar Reddy on 10/12/17.
//  Copyright © 2017 Pavan. All rights reserved.
//

import UIKit

class LayerAnimationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.layer.addSublayer(trackShapeLayer)
        view.layer.addSublayer(shapeLayer)
    }

    //MARK:- Properties
    lazy var shapeLayer:CAShapeLayer = {
        let obj  = CAShapeLayer()
        obj.fillColor = UIColor.clear.cgColor
        obj.strokeColor = UIColor.red.cgColor
        obj.lineWidth = 10
        obj.strokeEnd = 0
        obj.lineCap = kCALineCapRound
        obj.path = bezierPath.cgPath //UIBezierPath
        obj.add(basicAnimation, forKey: "basic") //CABasicAnimation
        return obj
    }()
    
    lazy var trackShapeLayer:CAShapeLayer = {
        let obj  = CAShapeLayer()
        obj.fillColor = UIColor.clear.cgColor
        obj.strokeColor = UIColor.lightGray.cgColor
        obj.lineWidth = 10
        obj.lineCap = kCALineCapRound
        obj.path = bezierPath.cgPath //UIBezierPath
        return obj
    }()
    
    lazy var bezierPath:UIBezierPath = {
        let obj  = UIBezierPath.init(arcCenter: self.view.center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi*2, clockwise: true)
        return obj
    }()
        /*startAngle: 0 Means circle start with left
         startAngle: -CGFloat.pi/2 Means circle start with top. on UIBezierPath method*/
    
    lazy var basicAnimation:CABasicAnimation = {
        let obj = CABasicAnimation.init(keyPath: "strokeEnd")
            obj.toValue = 1
            obj.duration = 2
            obj.fillMode = kCAFillModeForwards
            obj.isRemovedOnCompletion = false
        return obj
    }()
}
