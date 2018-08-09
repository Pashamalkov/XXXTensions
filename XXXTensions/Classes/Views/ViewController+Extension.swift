//
//  ViewController+Extension.swift
//  VTBMed
//
//  Created by artem.ermochenko on 29.03.2018.
//  Copyright © 2018 alina.usmanova. All rights reserved.
//

import UIKit

extension UIViewController {
    var safeAreaTopInset: CGFloat {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.top
        } else {
            return topLayoutGuide.length
        }
    }
    
    var safeAreaBottomInset: CGFloat {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.bottom
        } else {
            return bottomLayoutGuide.length
        }
    }
}
