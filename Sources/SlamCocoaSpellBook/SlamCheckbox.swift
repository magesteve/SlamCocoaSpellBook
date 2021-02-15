//
//  SlamCheckbox.swift
//  SlamCocoaSpellBook
//
//  Created by Steve Sheets on 4/7/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SwiftSpellBook

// MARK: Class

/// Closure based checkbox (NSButton with Checkbox settings)
public class SlamCheckbox: NSButton, SlamSwitchable {

    // MARK: SlamSwitchable Requirement
    
    public var slamSwitchState: Bool { (state == .on) }

    public var slamSwitchChangedEvent: SwiftSpellBook.BoolClosure?

    // MARK: Lifecycle Functions
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.setButtonType(.switch)
        self.allowsMixedState = false
        self.target = self
        self.action = #selector(pressedButtonAction)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setButtonType(.switch)
        self.allowsMixedState = false
        self.target = self
        self.action = #selector(pressedButtonAction)
    }
    
    // MARK: Action Functions
    
    /// Action to invoked with user presses button.
    /// - Parameter sender: Object that invoked the function
    @objc func pressedButtonAction(sender: Any!) {
        slamSwitchChangedAction()
    }

}
