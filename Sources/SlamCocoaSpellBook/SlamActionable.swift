//
//  SlamActionable.swift
//  SlamCocoaSpellBook
//
//  Created by Steve Sheets on 4/1/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import SwiftSpellBook

// MARK: Protocol

/// Protocol to support having actions.
///
/// Types that support SlamActionable manage a closure that attempts some action, with an utility function to invoke the closure. It is comon to use this protocol on Button-like views.
public protocol SlamActionable {

    // MARK: Required Properties
    
    /// Optional Pressed button action closure.
    var slamActionClosure: SwiftSpellBook.SimpleClosure? { get set }
    
}

// MARK: Extensions

public extension SlamActionable {
    
    // MARK: Public Functions
    
    /// Invoke Task Action
    func slamPerformAction() {
        if let block = slamActionClosure {
            block()
        }
    }

}
