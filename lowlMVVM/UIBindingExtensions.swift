//
//  UIBindingExtensions.swift
//  Lowl
//
//  Created by Jeremy Conkin on 3/26/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import UIKit
import lowlCore

infix operator ->>

func ->> (textField: UITextField, value: Bindable<String?>) {
    textField.bind(bindableValue: value)
}

extension UITextField {
    
    func bind(bindableValue: Bindable<String?>) {
        
        text = bindableValue.value
        let bond = Binding<String?>() { [unowned self] newValue in
            self.text = newValue
        }
        bindableValue.bind(binding: bond)
    }
}

func ->> (label: UILabel, value: Bindable<String?>) {
    label.bind(bindableValue: value)
}

extension UILabel {
    
    func bind(bindableValue: Bindable<String?>) {
        
        text = bindableValue.value
        let bond = Binding<String?>() { [unowned self] newValue in
            self.text = newValue
        }
        bindableValue.bind(binding: bond)
    }
}

func ->> (imageView: UIImageView, value: Bindable<OwlImageIdentifier?>) {
    imageView.bind(bindableValue: value)
}

extension UIImageView {
    
    func bind(bindableValue: Bindable<OwlImageIdentifier?>) {
        
        if let value = bindableValue.value {
            image = value.detailImage
        }
        
        let bond = Binding<OwlImageIdentifier?>() { [unowned self] newValue in
            
            if let newValue = newValue {
                self.image = newValue.detailImage
            } else {
                self.image = nil
            }
        }
        bindableValue.bind(binding: bond)
    }
}
