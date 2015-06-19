//
//  Border.swift
//  FrontWhalesOS
//
//  Created by Reed Carson on 6/19/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

@IBDesignable class Border: UIView {

    let context = UIGraphicsGetCurrentContext()

    @IBInspectable var strokeColor:UIColor = UIColor(red:0.15, green:0.66, blue:0.97, alpha:1)
    
    @IBInspectable var strokeWidth: CGFloat = 10
    
    @IBInspectable let fillColor: UIColor = UIColor.clearColor()
    
    @IBInspectable var inset: CGFloat = 10
    

    override func drawRect(rect: CGRect) {
  
//        CGContextSetLineWidth(context, strokeWidth)
//        CGContextSetStrokeColorWithColor(context, strokeColor.CGColor)
//        
        let borderWidth: CGFloat = frame.width
        let borderHeight: CGFloat = frame.height
//
//        let borderSize = CGRectMake(0, 0, borderWidth, borderHeight)
//        
//        CGContextAddRect(context, borderSize)
//        
//        CGContextStrokePath(context)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, strokeWidth)
        CGContextSetStrokeColorWithColor(context,
            UIColor.blueColor().CGColor)
        
        let rectangle = CGRectMake(0,0,borderWidth,borderHeight)
     
        
        let imageSize = CGSize(width: frame.width, height: frame.height)
        
        fillColor.set()
//        CGContextFillRect(context, rectangle)
        CGContextAddRect(context, rectangle)
        strokeColor.set()
        CGContextStrokePath(context)
      
    
        
    }


}
