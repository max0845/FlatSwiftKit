//
//  UIImageExtension.swift
//  FlatSwiftKit
//
//  Created by nike on 2015/3/13.
//  Copyright (c) 2015年 nike. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    class func edgeSizeFromCornerRadius(cornerRadius:CGFloat) -> CGFloat{
        return cornerRadius * 2 + 1
    }

    public class func imageWithColor(color:UIColor ,cornerRadius:CGFloat) -> UIImage{
        
        var minEdgeSize:CGFloat = edgeSizeFromCornerRadius(cornerRadius)
        var rect:CGRect = CGRect(x: 0, y: 0, width: minEdgeSize, height: minEdgeSize)
        var roundedRect:UIBezierPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        roundedRect.lineWidth = 0
        UIGraphicsBeginImageContextWithOptions(rect.size,false,0.0)
        color.setFill()
        roundedRect.stroke()
        roundedRect.addClip()
        var image:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image.resizableImageWithCapInsets(UIEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius))
    }

    public class func buttonImageWithColor(color:UIColor! ,cornerRadius:CGFloat!,shadowColor:UIColor?,shadowInsets:UIEdgeInsets) -> UIImage{

        var topImage:UIImage =  self.imageWithColor(color,cornerRadius:cornerRadius)
        var bottomImage:UIImage!
        
        if(shadowColor != nil){
            bottomImage = self.imageWithColor(color,cornerRadius:cornerRadius)
        }
        
        var totalHeight = edgeSizeFromCornerRadius(cornerRadius) + shadowInsets.top + shadowInsets.bottom;
        var totalWidth = edgeSizeFromCornerRadius(cornerRadius) + shadowInsets.left + shadowInsets.right;
        var topWidth = edgeSizeFromCornerRadius(cornerRadius);
        var topHeight = edgeSizeFromCornerRadius(cornerRadius);
        var topRect = CGRect(x: shadowInsets.left, y: shadowInsets.top, width: topWidth, height: topHeight)
        var bottomRect = CGRect (x: 0, y: 0, width: totalWidth, height: totalHeight)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: totalWidth, height: totalWidth),false,0.0)
        
        if (!CGRectEqualToRect(bottomRect, topRect)) {
            bottomImage?.drawInRect(bottomRect)
        }
        
        topImage.drawInRect(topRect)
        var buttonImage = UIGraphicsGetImageFromCurrentImageContext();
        var resizeableInsets = UIEdgeInsets(top: cornerRadius + shadowInsets.top, left: cornerRadius + shadowInsets.left, bottom: cornerRadius + shadowInsets.bottom, right: cornerRadius + shadowInsets.right)
        UIGraphicsEndImageContext()
        return buttonImage.resizableImageWithCapInsets(resizeableInsets)
    }

}
