//
//  MasterViewController
//  lowlMVVM
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import UIKit
import lowlCore
import lowlShared

/// Table view controller of owls
class MasterViewController: UITableViewController {
    
    public var viewModel: OwlMasterViewModel?
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
}

/// Table View methods
extension MasterViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let viewModel = viewModel,
            let masterDetailViewModel = viewModel.masterDetailViewModel {
            
            return masterDetailViewModel.owlDataSource.provideOwls().count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "owlCell", for: indexPath)
        if let owlCell = cell as? OwlTableViewCell {
            
            if let viewModel = viewModel,
                let masterDetailViewModel = viewModel.masterDetailViewModel {
                
                let detailOwl = masterDetailViewModel.owlDataSource.provideOwls()[indexPath.row]
                owlCell.bind(viewModel: OwlTableViewCellViewModel(detailOwl))
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel?.selectIndex(index: indexPath.row)
    }
}

