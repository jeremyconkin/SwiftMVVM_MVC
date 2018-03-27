//
//  OwlMasterViewModel.swift
//  Lowl
//
//  Created by Jeremy Conkin on 3/26/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import lowlCore

/// View model for table view of owls
class OwlMasterViewModel {
    
    /// Parent view model
    weak var masterDetailViewModel: OwlMasterDetailViewModel?
    
    /// Default initializer
    ///
    /// - Parameter masterDetailViewModel: Parent view model
    init(_ masterDetailViewModel: OwlMasterDetailViewModel) {
        self.masterDetailViewModel = masterDetailViewModel
    }
    
    /// Select owl at index
    ///
    /// - Parameter index: Inde of owl
    func selectIndex(index: Int) {
        masterDetailViewModel?.showOwlDetails(owlIndex: index)
    }
}
