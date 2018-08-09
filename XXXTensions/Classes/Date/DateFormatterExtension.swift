//
//  DateFormatterExtension.swift
//  VTBMed
//
//  Created by alina.usmanova on 19.03.2018.
//  Copyright © 2018 alina.usmanova. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static func doc_noTimeFormatMonthDay() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "d MMMM"
        return dateFormatter
    }
    
    static func doc_noTimeFormatMonthDayYear() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "d MMMM yyyy"
        return dateFormatter
    }
    
    static func onlyTime() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
    }
    
    func getUTCFormatter(_ format: String) -> DateFormatter {
        self.dateFormat = format
        self.timeZone = TimeZone.current 
        return self
    }
}
