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
    
    /// View model for the master page
    var masterViewModel: OwlMasterViewModel?
    
    /// View model for the details page
    var detailsViewModel: OwlDetailsViewModel?
    
    private var selectedModelUUID: UUID?
    
    private var selectedOwlName: String? {
        didSet {
            if let selectedModelUUID = selectedModelUUID,
                let selectedOwlName = selectedOwlName {
                
                updateOwlName(selectedModelUUID, newName: selectedOwlName)
            }
        }
    }
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - owlDataSource: Provider of owls
    ///   - splitViewController: Split view controller being updated via this view model
    init(_ owlDataSource: IOwlDataSource, splitViewController: OwlMVVMMasterDetailViewController) {
        
        self.owlDataSource = owlDataSource
        self.splitViewController = splitViewController
        self.masterViewModel = OwlMasterViewModel(self)
        self.detailsViewModel = OwlDetailsViewModel(nil)
        
        // Bind to details model changes
        let bond = Binding<String?>() { [unowned self] newValue in
            self.selectedOwlName = newValue
        }
        self.detailsViewModel?.owlName.bind(binding: bond)
    }
    
    /// Show detail page for an owl
    ///
    /// - Parameter owlIndex: Index of owl to select
    func showOwlDetails(owlIndex: Int) {
        
        if let detailsModel = detailsViewModel {
            
            detailsModel.owlModel = owlDataSource.provideOwls()[owlIndex]
            selectedModelUUID = detailsModel.owlModel?.uniqueIdentifier
            
            if let splitViewController = splitViewController,
                let detailVC = splitViewController.detailVC {
                
                detailVC.viewModel = detailsModel
                splitViewController.showDetailViewController(detailVC, sender: nil)
            }
        }
    }
    
    /// Update the give owl's name
    ///
    /// - Parameters:
    ///   - owlID: ID of given owl
    ///   - newName: New name for the owl
    func updateOwlName(_ owlID: UUID, newName: String) {
        
        let owlModel = owlDataSource.provideOwls().filter({ owl in owl.uniqueIdentifier == owlID}).first
        if let owlModel = owlModel {
            let newOwl = owlModel.CopyWithNewName(newName: newName)
            updateOwl(owlID, updatedOwl: newOwl)
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
