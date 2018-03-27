//
//  OwlTableViewCellViewModel.swift
//  Lowl
//
//  Created by Jeremy Conkin on 3/26/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import lowlCore

/// View model for a own table view cell
class OwlTableViewCellViewModel {
    
    /// Model for populating this view model
    var owlModel: OwlModel
    
    /// Reactive name
    var owlName = Bindable<String?>("")
    
    /// Reactive image identifier
    var imageID = Bindable<OwlImageIdentifier?>(.owl1)
    
    /// Default initialzier
    ///
    /// - Parameter owlModel: The owl backing this view model
    init(_ owlModel: OwlModel) {
        
        self.owlModel = owlModel
        owlName.value = owlModel.name
        imageID.value = owlModel.imageIdentifier
    }
}
