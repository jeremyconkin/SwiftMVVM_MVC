//
//  OwlModel.swift
//  lowl
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import Foundation

/// Model that describes an own
public struct OwlModel: Equatable {
    
    /// Identifier unique to this model
    public let uniqueIdentifier: UUID
    
    /// Enum identifier for the owl's headshot
    public let imageIdentifier: OwlImageIdentifier
    
    /// The owl's pretty print name
    public let name: String
    
    /// The owl's birthday
    public let birthday: Date
    
    // MARK: Static methods
    
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
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - uniqueIdentifier: Unique ID
    ///   - imageIdentifier: Image ID
    ///   - name: Pretty print name
    ///   - birthday: Birthday
    public init(uniqueIdentifier: UUID,
                imageIdentifier: OwlImageIdentifier,
                name: String,
                birthday: Date) {
        
        self.uniqueIdentifier = uniqueIdentifier
        self.imageIdentifier = imageIdentifier
        self.name = name
        self.birthday = birthday
    }
}

extension OwlModel: Hashable {
    
    public var hashValue: Int {
        return uniqueIdentifier.hashValue
    }
}
