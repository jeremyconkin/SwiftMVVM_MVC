//
//  OwlDetailsViewModel.swift
//  Lowl
//
//  Created by Jeremy Conkin on 3/26/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import lowlCore

class OwlDetailsViewModel {
    
    weak var masterDetailViewModel: OwlMasterDetailViewModel?
    
    var owlName = Bindable<String?>("")
    var owlBirthday = Bindable<String?>("")
    var imageID = Bindable<OwlImageIdentifier?>(.owl1)
    var owlModel: OwlModel?
    
    init(_ owlModel: OwlModel?, masterDetailViewModel: OwlMasterDetailViewModel) {
        
        self.owlModel = owlModel
        self.masterDetailViewModel = masterDetailViewModel
        
        if let owlModel = owlModel {
            
            owlName.value = owlModel.name
            owlBirthday.value = owlModel.birthday.formatAsBirthday()
            imageID.value = owlModel.imageIdentifier
        }
    }
    
    func setName(name: String?) {
        
        if let owlModel = owlModel {
            
            owlName = Bindable<String?>(name)
            let newOwl = owlModel.CopyWithNewName(newName: name ?? "")
            masterDetailViewModel?.updateOwl(owlModel.uniqueIdentifier, updatedOwl: newOwl)
        }
    }
}
