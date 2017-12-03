//
//  ViewController.swift
//  CALayer-Demo
//
//  Created by Pavan Kumar Reddy on 25/11/17.
//  Copyright © 2017 Pavan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //testView.layer.addSublayer(greenLayer)
        let greenFrame = CGRect.init(origin: .zero, size: testView.frame.size)
        greenLayer.frame = greenFrame
        
        /*let path = UIBezierPath.init(roundedRect: testView.bounds, cornerRadius: 20)
        testView.layer.shadowPath = path.cgPath
        testView.layer.shadowColor = UIColor.lightGray.cgColor
        testView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        testView.layer.shadowOpacity = 0.8
        testView.layer.cornerRadius = 20
        testView.layer.rasterizationScale = UIScreen.main.scale
        testView.layer.shouldRasterize = true*/

        
        let rect = testView.bounds
        let radius = CGSize.init(width: 20, height: 20)
        let path = UIBezierPath.init(roundedRect: rect, byRoundingCorners:[.topRight, .bottomLeft],
                                     cornerRadii: radius)
        
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        testView.layer.mask = maskLayer
        
    
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(true)
        
        //@CGAffineTransform
        let objAngle = CGFloat(Double.pi)
        print(Double.pi)
        print(radiansToDegress(radians: objAngle))
        
        //@ 2d Animation
       /* var affifneTransform = CGAffineTransform.identity
        affifneTransform = affifneTransform.translatedBy(x:0, y: 300)
        affifneTransform = affifneTransform.rotated(by: objAngle)
        affifneTransform = affifneTransform.scaledBy(x: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 1) {
            self.testView.transform = affifneTransform // Radians
        }*/

        //@3d Animation
        var animation3d = CATransform3DIdentity
            animation3d.m34 = -1.0/500
        
        UIView.animate(withDuration: 1.0) {
            
            self.testView.layer.transform = CATransform3DRotate(animation3d, -objAngle, 0, 1, 0) // x , y ,z
            
        }
        
    }
    
    func degreesToRadians(degrees: CGFloat) -> CGFloat {
        return degrees * .pi / 180
    }
    
    func radiansToDegress(radians: CGFloat) -> CGFloat {
        return radians * 180 / .pi
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
      if  let touch  = touches.first
      {
            let  mainPoint = touch.location(in: self.view)
            let  subViewPoint = self.greenLayer.convert(mainPoint, from: self.view.layer)
            print(subViewPoint)
            let mainPointFromSubPoint = self.view.layer.convert(subViewPoint, from: self.greenLayer)
            print(mainPointFromSubPoint)
      }
        
    }
    
    
    //@
   lazy var greenLayer:CALayer = {
        let obj = CALayer()
            obj.backgroundColor = UIColor.green.cgColor
            obj.contents = #imageLiteral(resourceName: "Testimage").cgImage
            obj.contentsGravity = kCAGravityResizeAspect
            obj.borderColor = UIColor.black.cgColor
            obj.borderWidth = 10.0
            obj.cornerRadius = 20
            //obj.magnificationFilter = kCAFilterNearest
            //obj.contentsScale = 2
            //obj.contentsRect = CGRect.init(x: 0, y: 0, width: 1, height: 0.5)
            obj.contentsCenter = CGRect.init(x: 0.25, y: 0.25, width: 1, height: 1)
            obj.masksToBounds = true
            //obj.opacity = 0.9
        return obj
    }()
    
}

