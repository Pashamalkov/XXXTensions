//
//  ViewExtensions.swift
//  VTBMed
//
//  Created by alina.usmanova on 12.03.2018.
//  Copyright © 2018 alina.usmanova. All rights reserved.
//

import UIKit

extension UIView {

    func makeCorners(with radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

    func makeCornersWithoutBounds(with radius: CGFloat) {
        layer.cornerRadius = radius
    }

    func makeRoundedCorners(corners: UIRectCorner, radii: CGSize) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: radii)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }

    static func makeSnapshot() -> UIImage? {
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        layer.render(in:context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    func makeShadow(color: UIColor, radius: CGFloat, offset: CGSize, opacity: Float) {
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }

    @discardableResult
    func makeGradient(colors: [CGColor]) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        layer.addSublayer(gradientLayer)
        return gradientLayer
    }

    func makeBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

extension UIView {
    func maskCornersWith(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layer.isOpaque = false
    }
    
    func maskTopCornersWith(radius: CGFloat) {
        roundCorners([.topLeft, .topRight], radius: radius)
    }
    
    func maskBottomCornersWith(radius: CGFloat) {
        roundCorners([.bottomLeft, .bottomRight], radius: radius)
    }
    
    func roundCorners(_ corners: UIRectCorner = .allCorners, radius: CGFloat) {
        let radii = CGSize(width: radius, height: radius)
        let roundedPath = UIBezierPath(roundedRect: self.bounds,
                                       byRoundingCorners: corners,
                                       cornerRadii: radii)
        let shape = CAShapeLayer()
        shape.path = roundedPath.cgPath
        self.layer.mask = shape
    }
    
    func setShadow(radius shadowRadius: CGFloat, color: UIColor,
                   opacity: Float, offset: CGSize, cornerRadius: CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.cornerRadius = cornerRadius
    }
}
