//
//  SlamSwitch.swift
//  SlamCocoaSpellBook
//
//  Created by Steve Sheets on 4/8/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SwiftSpellBook
import CocoaSpellBook


/// Closure based imave view (NSSwitch)
@available(OSX 10.15, *)
public class SlamSwitch: NSSwitch, SlamSwitchable {
    
    // MARK: - Static Function
    
    /// Make a slam checkbox with title, and action closure.
    public static func MakeSlamSwitch(state: Bool = false, changeAction: @escaping SwiftSpellBook.BoolClosure) -> SlamSwitch {
        let aSwitch = SlamSwitch(frame: .zero)
        
        aSwitch.slamSwitchChangedEvent = changeAction
        aSwitch.slamSwitchState = state

        return aSwitch
    }

    // MARK: - SlamSwitchable Requirement
        
    public var slamSwitchState: Bool {
        get {
            (state == .on)
        }
        set(newState) {
            state = newState ? .on : .off
        }
    }

    public var slamSwitchChangedEvent: SwiftSpellBook.BoolClosure?

    // MARK: - Lifecycle Functions

    override init(frame frameRect: NSRect) {
       super.init(frame: frameRect)
       
       self.target = self
       self.action = #selector(pressedButtonAction)
    }

    required public init?(coder: NSCoder) {
       super.init(coder: coder)
       
       self.target = self
       self.action = #selector(pressedButtonAction)
    }

    // MARK: - Action Functions

    /// Action to invoked with user presses button.
    /// - Parameter sender: Object that invoked the function
    @objc func pressedButtonAction(sender: Any!) {
       slamSwitchChangedAction()
    }
    
}
