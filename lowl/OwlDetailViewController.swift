//
//  OwlDetailViewController.swift
//  lowl
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import UIKit
import lowlCore

/// Displays details of a specific owl
class OwlDetailViewController: UIViewController {

    /// Reference to the master table for updating upon data editing
    weak var owlTableViewController: OwlTableViewController?
    
    /// Owl of which this page displays details
    var detailOwl: OwlModel? {
        didSet {
            
            if isViewLoaded {
                configureView()
            }
        }
    }
    
    // MARK: Outlets
    
    /// Displays and edits the owl's name
    @IBOutlet weak var nameTextField: UITextField!
    
    /// Displays "Birthday"
    @IBOutlet weak var birthdayStaticTextLabel: UILabel!
    
    /// Displays the owl's birthday
    @IBOutlet weak var birthdayLabel: UILabel!
    
    /// Show's an image of the owl
    @IBOutlet weak var owlHeadshotImageView: UIImageView!

    /// Tap to edit the owl details
    @IBOutlet weak var editButton: UIButton!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureView()
    }
    
    /// Start editing the owl details
    @IBAction func enterEditMode() {
        
        nameTextField.isEnabled = true
        nameTextField.becomeFirstResponder()
    }

    private func configureView() {
        
        if let detail = detailOwl {
            
            nameTextField.text = detail.name
            birthdayLabel.text = detail.birthday.formatAsBirthday()
            owlHeadshotImageView.image = detail.imageIdentifier.detailImage
            
            title = detail.name
            showDetails(show: true)
        } else {
            showDetails(show: false)
        }
    }

    private func showDetails(show: Bool) {
        
        nameTextField.isHidden = !show
        birthdayLabel.isHidden = !show
        birthdayStaticTextLabel.isHidden = !show
        owlHeadshotImageView.isHidden = !show
        editButton.isHidden = !show
    }
    
    private func stopEditing() {
        
        nameTextField.resignFirstResponder()
        nameTextField.isEnabled = false
    }
    
    private func updateOwlDetails() {
        
        if let detailOwl = detailOwl,
            let newName = nameTextField.text {
            
            let newOwl = detailOwl.CopyWithNewName(newName: newName)
            OwlDataSource().updateOwl(detailOwl.uniqueIdentifier, updatedOwl: newOwl)
            owlTableViewController?.tableView.reloadData()
        }
    }
}

extension OwlDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        stopEditing()
        updateOwlDetails()
        
        return true
    }
}
