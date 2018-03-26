//
//  OwlTableViewController.swift
//  lowlMVC
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import UIKit
import lowlCore
import lowlShared

class OwlTableViewController: UITableViewController {

    private var detailViewController: OwlDetailViewController? = nil
    private let owlDataSource: IOwlDataSource = OwlDataSource()

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? OwlDetailViewController
            detailViewController?.owlTableViewController = self
            detailViewController?.owlDataSource = owlDataSource;
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    private func showDetails(detailOwl: OwlModel) {
        
        if let detailViewController = detailViewController {
            
            detailViewController.detailOwl = detailOwl
            showDetailViewController(detailViewController, sender: self)
        }
    }
}

/// Table View methods
extension OwlTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return owlDataSource.provideOwls().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "owlCell", for: indexPath)
        
        let detailOwl = owlDataSource.provideOwls()[indexPath.row]
        cell.textLabel!.text = detailOwl.name
        cell.imageView?.image = detailOwl.imageIdentifier.detailImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let owl = owlDataSource.provideOwls()[indexPath.row]
        showDetails(detailOwl: owl)
    }
}

