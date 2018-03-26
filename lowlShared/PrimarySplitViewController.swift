//
//  PrimarySplitViewController.swift
//  lowlShared
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import UIKit

/// SplitViewController for this app
public class PrimarySplitViewController: UISplitViewController {
    
    public override func viewDidLoad() {
        
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
}

extension PrimarySplitViewController: UISplitViewControllerDelegate {
    
    public func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
}
