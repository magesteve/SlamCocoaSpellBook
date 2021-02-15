//
//  SlamCocoaSpellBook.swift
//  SlamCocoaSpellBook
//
//  Created by Steve Sheets on 2/9/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import SwiftSpellBook

// MARK: - Protocols

/// Protocol to support having actions.
///
/// Types that support SlamActionable manage a closure that attempts some action, with an utility function to invoke the closure. It is comon to use this protocol on Button-like views.
public protocol SlamActionable {

    // MARK: - Required Properties
    
    /// Optional Pressed button action closure.
    var slamActionClosure: SwiftSpellBook.SimpleClosure? { get set }
    
}

/// Protocol to support that can input text
///
/// Types that support SlamTextInputable are visible objects that support having a closure to invoke when the string value is changed.  It is comon to use this protocol on views like NSText or NSTextField.
public protocol SlamTextInputable {

    // MARK: - Required Properties

    /// Optional text change event
    var slamTextChangedEvent: SwiftSpellBook.StringClosure? { get set }

}

public protocol SlamSwitchable {

    // MARK: Required Properties
    
    // state of flag
    var slamSwitchState: Bool { get }

    /// Optional switch change event
    var slamSwitchChangedEvent: SwiftSpellBook.BoolClosure? { get set }

}

// MARK: - Extensions

public extension SlamActionable {
    
    // MARK: - Public Functions
    
    /// Invoke Task Action
    func slamPerformAction() {
        if let block = slamActionClosure {
            block()
        }
    }

}

public extension SlamSwitchable {
    
    // MARK: Public Functions

   /// change action
    func slamSwitchChangedAction() {
        if let block = slamSwitchChangedEvent {
            block(slamSwitchState)
        }
    }

}

// MARK: - Structure

/// Abstract Structure for SlamCocoaSpellBook
struct SlamCocoaSpellBook {

}

