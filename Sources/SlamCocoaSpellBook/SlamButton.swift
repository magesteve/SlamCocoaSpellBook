//
//  SlamButton.swift
//  SlamCocoaSpellBook
//
//  Created by Sheets, Steve on 5/28/17.
//  Copyright © 2020 Sheets, Steve. All rights reserved.
//

import Foundation
import Cocoa
import SwiftSpellBook

// MARK: - Class

/// Closure based button (NSButton)
public class SlamButton: NSButton, SlamActionable {

    // MARK: - SlamActionable
    
    public var slamActionClosure: SwiftSpellBook.SimpleClosure?
    
    // MARK: - Lifecycle Functions
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.setButtonType(.momentaryPushIn)
        self.allowsMixedState = false
        if self.target == nil {
            self.target = self
            self.action = #selector(pressedButtonAction)
        }
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setButtonType(.momentaryPushIn)
        self.allowsMixedState = false
        if self.target == nil {
            self.target = self
            self.action = #selector(pressedButtonAction)
        }
    }
    
    // MARK: - Action Functions
    
    /// Action to invoked with user presses button.
    /// - Parameter sender: Object that invoked the function
    @objc func pressedButtonAction(sender: Any!) {
        slamPerformAction()
    }

}


