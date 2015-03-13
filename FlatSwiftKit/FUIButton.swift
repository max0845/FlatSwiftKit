//
//  FUIButton.swift
//  FlatSwiftKit
//
//  Created by nike on 2015/3/13.
//  Copyright (c) 2015年 nike. All rights reserved.
//

import UIKit

public class FUIButton: UIButton {

    

    public var defaultEdgeInsets:UIEdgeInsets =  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    public var normalEdgeInsets:UIEdgeInsets  =  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    public var highlightedEdgeInsets:UIEdgeInsets  =  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    var cornerRadius:CGFloat = 0.0
    var shadowHeight:CGFloat = 0.0
    var buttonColor:UIColor?
    var shadowColor:UIColor?
    var highlightedColor:UIColor?
    var disabledColor:UIColor?
    var disabledShadowColor:UIColor?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.defaultEdgeInsets = self.titleEdgeInsets
        
    }
    
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    public func setTitleEdgeInsets(titleEdge:UIEdgeInsets){
        self.titleEdgeInsets = titleEdge
        self.setShadowHeight(self.shadowHeight)
    }
    
    public func setHighlighted(highlighted:Bool){
        let insets:UIEdgeInsets = highlighted ? self.highlightedEdgeInsets : self.normalEdgeInsets;
        self.titleEdgeInsets = insets
        self.highlighted = highlighted
    }
    
    
    public func setCornerRadius(cornerRadius:CGFloat) -> FUIButton{
        self.cornerRadius = cornerRadius
        return self
    }
    
    
    public func setButtonColor(buttonColor:UIColor) -> FUIButton{
        self.buttonColor = buttonColor
        return self
    }
    
    public func setShadowColor(shadowColor:UIColor) -> FUIButton{
        self.shadowColor = shadowColor
        return self
    }
    
    public func setHighlightedColor(highlightedColor:UIColor) -> FUIButton{
        self.highlightedColor = highlightedColor
        return self
    }
    
    public func setDisabledColor(disabledColor:UIColor) -> FUIButton{
        self.disabledColor = disabledColor
        return self
    }
    
    public func setDisabledShadowColor(disabledShadowColor:UIColor) -> FUIButton{
        self.disabledShadowColor = disabledShadowColor
        return self
    }
    
    public func setShadowHeight(shadowHeight:CGFloat) -> FUIButton{
        self.shadowHeight = shadowHeight
        var insets = self.defaultEdgeInsets
        insets.top += shadowHeight
        self.highlightedEdgeInsets = insets
        insets.top -= shadowHeight * 2.0
        self.normalEdgeInsets = insets
        super.titleEdgeInsets = insets
        return self
    }
    
    
    public func config(){
        
        var normalBackgroundImage:UIImage = UIImage.buttonImageWithColor(self.buttonColor, cornerRadius: self.cornerRadius, shadowColor: self.shadowColor, shadowInsets: UIEdgeInsets(top: 0, left: 0, bottom: self.shadowHeight, right: 0))
        
        var highlightedColor = self.highlightedColor == nil ? self.buttonColor : self.highlightedColor;
        var highlightedBackgroundImage = UIImage.buttonImageWithColor(highlightedColor, cornerRadius: cornerRadius, shadowColor: UIColor.clearColor() , shadowInsets: UIEdgeInsets(top: self.shadowHeight, left: 0, bottom: 0, right: 0))
        
        if ((self.disabledColor) != nil) {
            var disabledShadowColor = self.disabledShadowColor == nil ? self.shadowColor : self.disabledShadowColor;
            var disabledBackgroundImage = UIImage.buttonImageWithColor(self.disabledColor, cornerRadius: self.cornerRadius, shadowColor: UIColor.clearColor() , shadowInsets: UIEdgeInsets(top: 0, left: 0, bottom: self.shadowHeight, right: 0))
            self.setBackgroundImage(disabledBackgroundImage, forState: UIControlState.Disabled)
        }
        
        self.setBackgroundImage(normalBackgroundImage, forState: UIControlState.Normal)
        self.setBackgroundImage(highlightedBackgroundImage, forState: UIControlState.Highlighted)
        
    }
    
    
}
