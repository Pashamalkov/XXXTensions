//
//  DateExtension.swift
//  VTBMed
//
//  Created by alina.usmanova on 19.03.2018.
//  Copyright © 2018 alina.usmanova. All rights reserved.
//

import Foundation

public extension Date {
    
    static func minimumDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.date(from: "1900/01/01 00:00") ?? Date()
    }
    
    func getYear() -> Int {
        let calendar = Calendar.current
        let ageComponent = calendar.dateComponents([.year], from: self, to: Date())
        return ageComponent.year ?? 0
    }

    func getStringDate(format: String) -> String {
        let dateFormatter = DateFormatter().getUTCFormatter(format)
        return dateFormatter.string(from: self)
    }

    static func convert(_ string: String) -> Date? {
        let dateFormatter = DateFormatter().getUTCFormatter("yyyy-MM-dd'T'HH:mm:ssZZZZZ")
        return dateFormatter.date(from: string)
    }
    
    func convertToUTC() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return formatter.string(from: self)
    }
}

extension Date {
    func differenceInSeconds(from date: Date) -> Int {
        let seconds = Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
        return labs(seconds)
    }
}

