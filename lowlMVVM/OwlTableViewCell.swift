//
//  OwlTableViewCell.swift
//  Lowl
//
//  Created by Jeremy Conkin on 3/26/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import UIKit

/// Table view cell for an owl
class OwlTableViewCell: UITableViewCell {
    
    /// Become reactive to properties in a view model
    ///
    /// - Parameter viewModel: The view model
    func bind(viewModel: OwlTableViewCellViewModel) {
        
        if let textLabel = textLabel {
            textLabel ->> viewModel.owlName
        }
        
        if let imageView = imageView {
            imageView ->> viewModel.imageID
        }
    }
    
}
