//
//  OwlMVVMMasterDetailViewController.swift
//  Lowl
//
//  Created by Jeremy Conkin on 3/26/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import UIKit
import lowlShared

public class OwlMVVMMasterDetailViewController: UISplitViewController {
    
    var viewModel: OwlMasterDetailViewModel?
    
    private (set) internal var masterVC: MasterViewController?
    private (set) internal var detailVC: DetailViewController?
    
    public override func viewDidLoad() {
        
        self.delegate = self
        self.preferredDisplayMode = .allVisible
        
        viewModel = OwlMasterDetailViewModel(OwlDataSource(), splitViewController: self)
        
        masterVC = (viewControllers[0] as! UINavigationController).topViewController as? MasterViewController
        detailVC = (viewControllers[1] as! UINavigationController).topViewController as? DetailViewController
        
        if let viewModel = viewModel {
            
            masterVC?.viewModel = viewModel.masterViewModel
            detailVC?.viewModel = viewModel.detailsViewModel
        }
    }
}

extension OwlMVVMMasterDetailViewController: UISplitViewControllerDelegate {
    
    public func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
}
