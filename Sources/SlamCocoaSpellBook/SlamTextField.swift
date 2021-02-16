//
//  SlamTextField.swift
//  SlamCocoaSpellBook
//
//  Created by Steve Sheets on 3/29/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SwiftSpellBook
import CocoaSpellBook

/// Slam Based input style Text Field (NSTextField)
public class SlamTextField: NSTextField, NSTextFieldDelegate, SlamTextInputable {
    
    // MARK: - Static Function
    
    /// Make a slam checkbox with title, and action closure.
    public static func MakeSlamTextField(text: String = "", changeAction: @escaping SwiftSpellBook.StringClosure) -> SlamTextField {
        let aTextField = SlamTextField(frame: .zero)
        
        aTextField.slamTextChangedEvent = changeAction
        aTextField.slamTextState = text
        
        return aTextField
    }

    // MARK: - SlamTextInputable Requirements
    
    public var slamTextState:String {
        get {
            stringValue
        }
        set(newString) {
            stringValue = newString
        }
    }
    
    public var slamTextChangedEvent: SwiftSpellBook.StringClosure?

    
    // MARK: - Lifecycle

    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        delegate = self
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        delegate = self
    }
    
    // MARK: - NSControlTextEditingDelegate Functions
    
    public func controlTextDidChange(_ obj: Notification) {
        if let block = slamTextChangedEvent {
            block(stringValue)
        }
    }
    
}

