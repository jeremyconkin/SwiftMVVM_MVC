//
//  DetailViewController.swift
//  lowlMVC
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import UIKit
import lowlCore
import lowlShared

/// Displays details of a specific owl
class DetailViewController: UIViewController {
    
    var viewModel: OwlDetailsViewModel? {
        didSet {
            setupBindings()
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
        showDetails(false)
        setupBindings()
    }
    
    /// Start editing the owl details
    @IBAction func enterEditMode() {
        
        nameTextField.isEnabled = true
        nameTextField.becomeFirstResponder()
    }
    
    private func setupBindings() {
        
        if !isViewLoaded {
            return
        }
        
        if let viewModel = viewModel {
            
            nameTextField ->> viewModel.owlName
            birthdayLabel ->> viewModel.owlBirthday
            owlHeadshotImageView ->> viewModel.imageID
            showDetails(true)
        }
    }
    
    private func showDetails(_ show: Bool) {
        
        let isHidden = !show || (viewModel == nil) || (viewModel!.owlModel == nil)
        nameTextField.isHidden = isHidden
        birthdayLabel.isHidden = isHidden
        birthdayStaticTextLabel.isHidden = isHidden
        owlHeadshotImageView.isHidden = isHidden
        editButton.isHidden = isHidden
    }
    
    private func stopEditing() {
        
        nameTextField.resignFirstResponder()
        nameTextField.isEnabled = false
    }
}

extension DetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        stopEditing()
        viewModel?.setName(name: textField.text)
        
        return true
    }
}
