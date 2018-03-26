//
//  IOwlDataSource.swift
//  lowlCore
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import Foundation

/// Provides datasets of owls and updates to it
public protocol IOwlDataSource: class {
    
    /// Return the current collection of owls
    ///
    /// - Returns: Array of owl models
    func provideOwls() -> [OwlModel]
    
    /// Replace an owl in the dataset
    ///
    /// - Parameters:
    ///   - owlID: UUID of the owl to update
    ///   - updatedOwl: Replacement owl for owl of owlID
    func updateOwl(_ owlID: UUID, updatedOwl: OwlModel)
}
