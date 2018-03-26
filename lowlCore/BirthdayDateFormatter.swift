//
//  BirthdayDateFormatter.swift
//  lowlCore
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Format this date as this app's birthday format string
    ///
    /// - Returns: String birthday
    public func formatAsBirthday() -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
