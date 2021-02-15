//
//  SlamTextField.swift
//  SlamCocoaSpellBook
//
//  Created by Steve Sheets on 3/29/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SwiftSpellBook

/// Slam Based input style Text Field (NSTextField)
public class SlamTextField: NSTextField, NSTextFieldDelegate, SlamTextInputable {
    
    // MARK: - SlamTextInputable Requirements
    
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

