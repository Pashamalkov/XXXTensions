//
//  ImageSize.swift
//  VTBMed
//
//  Created by alina.usmanova on 23.04.2018.
//  Copyright © 2018 alina.usmanova. All rights reserved.
//

import UIKit

extension UIImage {
    func resizeImage(newWidth: CGFloat) -> UIImage {

        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
