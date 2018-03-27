//
//  OwlDetailsViewModel.swift
//  Lowl
//
//  Created by Jeremy Conkin on 3/26/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import lowlCore

/// View model for the owl details page
class OwlDetailsViewModel {
    
    /// Name of the owl
    var owlName = Bindable<String?>("")
    
    /// Birthday of the owl
    var owlBirthday = Bindable<String?>("")
    
    /// Image ID of the owl
    var imageID = Bindable<OwlImageIdentifier?>(.owl1)
    
    /// Model backing the view model
    var owlModel: OwlModel? {
        didSet {
            if let owlModel = owlModel {
                
                owlName.value = owlModel.name
                owlBirthday.value = owlModel.birthday.formatAsBirthday()
                imageID.value = owlModel.imageIdentifier
            }
        }
    }
    
    /// Default initializer
    ///
    /// - Parameter owlModel: Owl
    init(_ owlModel: OwlModel?) {
        
        self.owlModel = owlModel
    }
}
