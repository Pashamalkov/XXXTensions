//
//  Label+Extension.swift
//  VTBMed
//
//  Created by artem.ermochenko on 04.04.2018.
//  Copyright © 2018 alina.usmanova. All rights reserved.
//

import UIKit

public func countLinesOf(text: String, font: UIFont, in bounds: CGSize? = UIScreen.main.bounds.size) -> Int {
    let myText = text as NSString
    var rect: CGSize
    
    if let bounds = bounds {
        rect = bounds
    } else {
        rect = CGSize(width: UIScreen.main.bounds.width - 32 , height: CGFloat.greatestFiniteMagnitude)
    }
    
    let textSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
    return Int(ceil(CGFloat(textSize.height) / font.lineHeight))
}

public extension UILabel {
    func calculateHeightForLabelWith(stepForRow: Float) -> Float {
        return stepForRow * Float(countLinesOf(text: text ?? "", font: font))
    }
    
    func setText(_ text: String?, attributes: [NSAttributedStringKey: Any]?) {
        guard let text = text else { self.attributedText = nil; return }
        self.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    
    func setTextAttributes(_ attributes: [NSAttributedStringKey: Any]) {
        if let textString = self.text, !textString.isEmpty {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttributes(attributes, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
    
    func setLineHeight(_ lineHeight: CGFloat) {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineHeight
        setTextAttributes([NSAttributedStringKey.paragraphStyle: style])
    }
    
    var numberOfVisibleLines: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.lineHeight))
        return rHeight / charSize
    }
    
    func setLetterSpacing(_ space: CGFloat = 0.2) {
        setTextAttributes([NSAttributedStringKey.kern:space])
    }
    
    func setLineStyle(_ height: CGFloat = 5.2, _ space: CGFloat = 0.2) {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5.2
        setTextAttributes([NSAttributedStringKey.kern:space, NSAttributedStringKey.paragraphStyle: style])
    }
}
