//
//  Binding.swift
//  Lowl
//
//  Created by Jeremy Conkin on 3/26/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

/// Thing that sends callbacks for Bindable
class Binding<T> {
    
    /// Binding callback type
    typealias BindingCallback = (T) -> Void
    
    /// Callback
    var listener: BindingCallback
    
    /// Default initializer
    ///
    /// - Parameter listener: Binding callback
    init(_ listener: @escaping BindingCallback) {
        self.listener = listener
    }
}
