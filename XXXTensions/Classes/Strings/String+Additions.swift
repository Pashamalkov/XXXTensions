//
//  String+Additions.swift
//  VTBMed
//
//  Created by Lev on 09.07.2018.
//  Copyright © 2018 alina.usmanova. All rights reserved.
//

import Foundation

public extension String {
    func initials() -> String? {
        let components = self.components(separatedBy: " ")
        guard !components.isEmpty else { return nil }
        return components.reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
    }
}

public extension String {
    var digits: String {
        let pattern = "[^0-9]" // not a number
        return replacingOccurrences(of: pattern, with: "", options: .regularExpression)
    }
    
    var phoneCharacters: String {
        let pattern = "[^+0-9]" // not a +, not a number
        return replacingOccurrences(of: pattern, with: "", options: .regularExpression)
    }
}
