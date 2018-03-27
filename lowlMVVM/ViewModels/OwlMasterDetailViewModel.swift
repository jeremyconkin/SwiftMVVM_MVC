//
//  OwlMasterDetailViewModel.swift
//  Lowl
//
//  Created by Jeremy Conkin on 3/26/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import lowlCore

/// Owl master detail view model
class OwlMasterDetailViewModel {

    /// Provider of owls
    public let owlDataSource: IOwlDataSource

    /// View controller this model updates
    weak var splitViewController: OwlMVVMMasterDetailViewController?
    
    /// View model for the details page
    var detailsModel: OwlDetailsViewModel?
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - owlDataSource: Provider of owls
    ///   - splitViewController: Split view controller being updated via this view model
    init(_ owlDataSource: IOwlDataSource, splitViewController: OwlMVVMMasterDetailViewController) {
        
        self.owlDataSource = owlDataSource
        self.splitViewController = splitViewController
        self.detailsModel = OwlDetailsViewModel(nil, masterDetailViewModel: self)
    }
    
    /// Show detail page for an owl
    ///
    /// - Parameter owlIndex: Index of owl to select
    func showOwlDetails(owlIndex: Int) {
        
        if let detailsModel = detailsModel {
            
            detailsModel.owlModel = owlDataSource.provideOwls()[owlIndex]
            if let splitViewController = splitViewController,
                let detailVC = splitViewController.detailVC {
                
                detailVC.viewModel = OwlDetailsViewModel(owlDataSource.provideOwls()[owlIndex], masterDetailViewModel: self)
                splitViewController.showDetailViewController(detailVC, sender: nil)
            }
        }
    }
    
    /// Replace one owl with another
    ///
    /// - Parameters:
    ///   - owlID: Identifier of the owl
    ///   - updatedOwl: New owl
    func updateOwl(_ owlID: UUID, updatedOwl: lowlCore.OwlModel) {
        
        owlDataSource.updateOwl(owlID, updatedOwl: updatedOwl)
        splitViewController?.masterVC?.tableView.reloadData()
    }
}
