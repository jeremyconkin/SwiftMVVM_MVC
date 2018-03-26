//
//  OwlDataSource.swift
//  lowl
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import lowlCore

/// Model that represents an owl
class OwlDataSource {
    
    private static let dateFormatter = DateFormatter()
    
    private static var owlDataset = initializeOwls()
    
    private static func initializeOwls() -> [OwlModel] {
        
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let owls = [
            OwlModel(uniqueIdentifier: UUID(),
                     imageIdentifier: .owl1,
                     name: "Hootie",
                     birthday: dateFormatter.date(from: "2016/10/08")!),
            OwlModel(uniqueIdentifier: UUID(),
                     imageIdentifier: .owl2,
                     name: "Kate",
                     birthday: dateFormatter.date(from: "2012/10/31")!),
            OwlModel(uniqueIdentifier: UUID(),
                     imageIdentifier: .owl3,
                     name: "Woodsy",
                     birthday: dateFormatter.date(from: "2008/01/16")!),
            OwlModel(uniqueIdentifier: UUID(),
                     imageIdentifier: .owl4,
                     name: "Hedwig",
                     birthday: dateFormatter.date(from: "1999/12/10")!),
            OwlModel(uniqueIdentifier: UUID(),
                     imageIdentifier: .owl5,
                     name: "Lucy",
                     birthday: dateFormatter.date(from: "2001/09/10")!),
            OwlModel(uniqueIdentifier: UUID(),
                     imageIdentifier: .owl6,
                     name: "Huntress",
                     birthday: dateFormatter.date(from: "2012/06/30")!),
            OwlModel(uniqueIdentifier: UUID(),
                     imageIdentifier: .owl7,
                     name: "Great",
                     birthday: dateFormatter.date(from: "2014/06/22")!),
            OwlModel(uniqueIdentifier: UUID(),
                     imageIdentifier: .owl8,
                     name: "Mister",
                     birthday: dateFormatter.date(from: "2016/04/09")!),
            OwlModel(uniqueIdentifier: UUID(),
                     imageIdentifier: .owl9,
                     name: "Oweletta",
                     birthday: dateFormatter.date(from: "2010/09/10")!)
        ]
        
        return owls
    }
    
    /// Return the current collection of owls
    ///
    /// - Returns: Array of owl models
    func provideOwls() -> [OwlModel] {
        
        return OwlDataSource.owlDataset
    }
    
    /// Replace an owl in the dataset
    ///
    /// - Parameters:
    ///   - owlID: UUID of the owl to update
    ///   - updatedOwl: Replacement owl for owl of owlID
    func updateOwl(_ owlID: UUID, updatedOwl: OwlModel) {
        
        if let owlIndex = OwlDataSource.owlDataset.index(where: {$0.uniqueIdentifier == owlID}) {
            OwlDataSource.owlDataset[owlIndex] = updatedOwl
        }
    }
    
}
