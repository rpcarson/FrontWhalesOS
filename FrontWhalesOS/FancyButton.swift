//
//  FancyButton.swift
//  FrontWhalesOS Project
//
//  Created by Reed Carson on 6/17/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

@IBDesignable class FancyButton: UIButton {

    @IBInspectable var lineWidth: CGFloat = 5
    
    @IBInspectable var inset: CGFloat = 1
    
   @IBInspectable var color: UIColor = UIColor.redColor()
    
    @IBInspectable var strokeColor: UIColor = UIColor.blackColor()
   
    @IBInspectable var cornerRad: CGFloat = 20
  
    override func drawRect(rect: CGRect) {
       
        let context = UIGraphicsGetCurrentContext()

        
        
        let insetRect = CGRectInset(rect, inset, inset)
        
        var path = UIBezierPath(roundedRect: insetRect, cornerRadius: cornerRad)
        
        
        color.set()

        CGContextAddPath(context, path.CGPath)
        CGContextFillPath(context)
        
        strokeColor.set()
        
        CGContextSetLineWidth(context, lineWidth)
        CGContextAddPath(context, path.CGPath)
        CGContextStrokePath(context)
//        CGContextStrokeRect(context, rect)
    }


}
