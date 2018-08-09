//
//  UIView + CornerRadius.swift
//  doctor-on-call-client
//
//  Created by manuely.aurora on 14.09.17.
//  Copyright © 2017 Hands and Heads. All rights reserved.
//

import UIKit
// https://stackoverflow.com/questions/25551053/cornerradius-with-border-some-glitch-at-border
// Solution for glitch bug in CA, when used on UIImageView with borders.

protocol CornerRadius {
    func makeBorderWithCorner(radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat)
}

extension UIView: CornerRadius
{
    func makeBorderWithCorner(radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        let rect = self.bounds;
        
        let maskPath = UIBezierPath(roundedRect: rect,
                                    byRoundingCorners: .allCorners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        
        // Create the shape layer and set its path
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path  = maskPath.cgPath
        
        // Set the newly created shape layer as the mask for the view's layer
        self.layer.mask = maskLayer
        
        //Create path for border
        let borderPath = UIBezierPath(roundedRect: rect,
                                      byRoundingCorners: .allCorners,
                                      cornerRadii: CGSize(width: radius, height: radius))
        
        // Create the shape layer and set its path
        let borderLayer = CAShapeLayer()
        
        borderLayer.frame       = rect
        borderLayer.path        = borderPath.cgPath
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.fillColor   = UIColor.clear.cgColor
        borderLayer.lineWidth   = borderWidth * UIScreen.main.scale
        
        //Add this layer to give border.
        self.layer.addSublayer(borderLayer)
    }
}
