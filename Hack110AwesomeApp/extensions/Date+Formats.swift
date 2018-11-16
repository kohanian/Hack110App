//
//  Date+Formats.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/16/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import Foundation

extension Date {
    static let defaultFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let wordedMonth = "MMM d, yyyy"
    
    static func formatDate(from string: String, format: String? = nil) -> Date? {
        var dateFormat = Date.defaultFormat
        if let format = format {
            dateFormat = format
        }
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.date(from: string)
    }
    
    func toString(to format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
