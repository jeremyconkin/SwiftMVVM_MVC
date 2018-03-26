//
//  BirthdayDateFormatter.swift
//  lowl
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import Foundation

extension Date {
    
    /// Format this date as this app's birthday format string
    ///
    /// - Returns: String birthday
    func formatAsBirthday() -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
