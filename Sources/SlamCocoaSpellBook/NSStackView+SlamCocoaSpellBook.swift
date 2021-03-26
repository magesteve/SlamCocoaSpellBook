//
//  NSStackView+SlamCocoaSpellBook.swift.swift
//  SlamCocoaSpellBook
//
//  Created by Sheets, Steve on 3/26/21.
//  Copyright © 2020 Sheets, Steve. All rights reserved.
//

import Foundation
import Cocoa

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

}


