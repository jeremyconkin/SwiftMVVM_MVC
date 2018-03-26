//
//  OwlModel.swift
//  lowl
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import Foundation

/// Model that describes an own
struct OwlModel: Equatable {
    
    /// Identifier unique to this model
    let uniqueIdentifier: UUID
    
    /// Enum identifier for the owl's headshot
    let imageIdentifier: OwlImageIdentifier
    
    /// The owl's pretty print name
    let name: String
    
    /// The owl's birthday
    let birthday: Date
    
    /// Compare to owls
    ///
    /// - Parameters:
    ///   - lhs: Left owl
    ///   - rhs: Right owl
    /// - Returns: True if equal owls
    public static func ==(lhs: OwlModel, rhs: OwlModel) -> Bool {
        
        return (lhs.uniqueIdentifier == rhs.uniqueIdentifier
            && (lhs.imageIdentifier == rhs.imageIdentifier)
            && (lhs.name == rhs.name)
            && (lhs.birthday == rhs.birthday))
    }
    
    /// Copy this owl, but change the name
    ///
    /// - Parameter newName: New name to set
    /// - Returns: New owl model
    public func CopyWithNewName(newName: String) -> OwlModel {
        
        return OwlModel(uniqueIdentifier: uniqueIdentifier,
                        imageIdentifier: imageIdentifier,
                        name: newName,
                        birthday: birthday)
    }
}

extension OwlModel: Hashable {
    
    var hashValue: Int {
        return uniqueIdentifier.hashValue
    }
}
