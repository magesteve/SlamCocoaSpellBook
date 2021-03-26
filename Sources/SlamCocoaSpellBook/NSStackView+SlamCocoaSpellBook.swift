//
//  NSStackView+SlamCocoaSpellBook.swift.swift
//  SlamCocoaSpellBook
//
//  Created by Sheets, Steve on 3/26/21.
//  Copyright © 2020 Sheets, Steve. All rights reserved.
//

import Foundation
import Cocoa
import SwiftSpellBook
import CocoaSpellBook

// MARK: - Extension NSStackView

public extension NSStackView {
    
    // MARK: - Static Functions
    
    static func spellMakeVerticalStackView(width: Int? = nil) -> NSStackView {
        let aStack = NSStackView(frame: .zero)
        
        aStack.orientation = .vertical
        aStack.alignment = .centerX
        aStack.distribution = .fill
        aStack.spacing = 8
        
        if let width = width {
            let constraints = [
                aStack.widthAnchor.constraint(equalToConstant: CGFloat(width))
            ]
            NSLayoutConstraint.activate(constraints)
        }
        
        return aStack
    }

    // MARK: - Public Functions
    
    /// Add given view to stack. If label is not nil, first add label field witht text.
    /// - Parameters:
    ///   - view: NSView to add
    ///   - label: Optional String to add to label
    func spellAddStandard(view: NSView, label: String? = nil, leftLabel: Bool = false) {
        if let text = label, text.isNotEmpty {
            spellAddLabel(text: text, leftLabel: leftLabel)
        }
        
        view.heightAnchor.constraint(greaterThanOrEqualToConstant: 20.0).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = true

        addArrangedSubview(view)
    }
    
    /// Add Label (text field) to stack.
    /// - Parameters:
    ///   - text: String text to place in text field.
    ///   - leftLabel: Bool if true, expand text so left justified.
    @discardableResult func spellAddLabel(text: String, leftLabel: Bool = false) -> NSTextField {
        let aLabel = NSTextField(frame: NSRect.zero)
        
        aLabel.stringValue = text
        aLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20.0).isActive = true
        aLabel.isEditable = false
        aLabel.isSelectable = false
        aLabel.isBordered = false
        aLabel.isBezeled = false
        aLabel.backgroundColor = .clear
        aLabel.translatesAutoresizingMaskIntoConstraints = true

        addArrangedSubview(aLabel)
        
        if leftLabel {
            aLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
       }

        return aLabel
    }
    
    /// Make a slam button with title, and action closure, add it to stack centered
    @discardableResult func spellAddButton(title: String, action: @escaping SwiftSpellBook.SimpleClosure) -> SlamButton {
        let view = SlamButton.MakeSlamButton(title: title, action: action)
        spellAddStandard(view: view)
        return view
    }

    /// Make a slam checkbox with title, and action closure, add it to stack left side.
    @discardableResult func spellAddCheckbox(title: String, state: Bool = false, changeAction: @escaping SwiftSpellBook.BoolClosure) -> SlamCheckbox {
        let view = SlamCheckbox.MakeSlamCheckbox(title: title, state: state, changeAction: changeAction)
        spellAddStandard(view: view, leftLabel: true)
        return view
    }

    /// Make a slam switch with title, and action closure, add it to stack left side.
    @discardableResult func spellAddSwitch(title: String, state: Bool = false, changeAction: @escaping SwiftSpellBook.BoolClosure) -> SlamSwitch {
        let view = SlamSwitch.MakeSlamSwitch(state: state, changeAction: changeAction)
        spellAddStandard(view: view, label: title, leftLabel: true)
        return view
    }

    /// Make a slam textfield with title, and action closure,  add it to stack.
    @discardableResult func spellAddTextField(text: String = "", title: String = "", changeAction: @escaping SwiftSpellBook.StringClosure) -> SlamTextField {
        let view = SlamTextField.MakeSlamTextField(text: text, changeAction: changeAction)
        spellAddStandard(view: view, label: title, leftLabel: true)
        return view
    }
}


