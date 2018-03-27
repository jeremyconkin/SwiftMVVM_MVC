//
//  Bindable.swift
//  Lowl
//
//  Created by Jeremy Conkin on 3/26/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

/// A wrapper for a value that can cause events when a the value changes
class Bindable<T> {

    /// Value being bound
    var value: T {
        didSet {
            
            binds.forEach() { bind in
                bind.listener(value)
            }
        }
    }
    
    private var binds: [Binding<T>] = []
    
    
    /// Default initializer
    ///
    /// - Parameter v: Value to bind
    init(_ v: T) {
        value = v
    }
    
    /// Bind this value to a binding
    ///
    /// - Parameter binding: Binding to which to be bound
    func bind(binding: Binding<T>) {
        binds.append(binding)
    }
    
    /// Stop being bound
    func unbindAll() {
        binds.removeAll()
    }
}
