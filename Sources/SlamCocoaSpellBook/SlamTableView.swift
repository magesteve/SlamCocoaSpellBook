//
//  SlamTableView.swift
//  SlamCocoaSpellBook
//
//  Created by Steve Sheets on 4/24/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SwiftSpellBook
import CocoaSpellBook

// MARK: - Class

/// Simpliest style closure based Table View
public class SlamTableView: NSTableView, NSTableViewDelegate, NSTableViewDataSource {

    // MARK: - Static Function
    
    /// Make a slam checkbox with title, and action closure.
    public static func MakeSlamTableView(changeAction: SwiftSpellBook.IntClosure?) -> SlamTableView {
        let aTableView = SlamTableView(frame: .zero)
        
        aTableView.selectionChangedEvent = changeAction
        
        return aTableView
    }

// MARK: - Properties
    
    /// Optional closure to return number of items in table
    public var numberDataSource: SwiftSpellBook.IntResultClosure?
    
    /// Optional closure to return text, based on row number
    public var textDataSource: SwiftSpellBook.IntInformStringResultClosure?
    
    /// Optional closure to return array to use for closure
    public var arrayDataSource: SwiftSpellBook.ArrayResultClosure?
    
    /// Optional closure to keep track of current selected item
    public var selectionChangedEvent: SwiftSpellBook.IntClosure?

    /// Optional closure to keep track of double clicking on row
    public var doubleClickEvent: SwiftSpellBook.IntClosure?

// MARK: - Lifecycle Methods
    
    override public init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        dataSource = self
        delegate = self
        allowsMultipleSelection = false
        allowsEmptySelection = true
        allowsColumnSelection = false
        target = self
        doubleAction = #selector(tableViewDoubleAction)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        dataSource = self
        delegate = self
        allowsMultipleSelection = false
        allowsEmptySelection = true
        allowsColumnSelection = false
        target = self
        doubleAction = #selector(tableViewDoubleAction)
    }
    
// MARK: - NSTableViewDelegate Methods
    
    public func tableViewSelectionDidChange(_ notification: Notification) {
        guard let event = selectionChangedEvent else { return }
        
        event(self.selectedRow)
    }
    
    public func tableView(_ tableView: NSTableView, shouldEdit tableColumn: NSTableColumn?, row: Int) -> Bool {
        return false
    }
    
// MARK: - NSTableViewDataSource Methods
    
    public func numberOfRows(in tableView: NSTableView) -> Int {
        if let source = numberDataSource {
            return source()
        }
        else if let source = arrayDataSource {
            let list = source()
            
            return list.count
        }
        
        return 0
    }
    
    public func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        if let source = textDataSource {
            return source(row)
        }
        else if let source = arrayDataSource {
            let list = source()
            
            if row >= 0 && row < list.count {
                if let item = list[row] as? String {
                    return item
                }
            }
        }
        
        return nil
    }
    
// MARK: - Objective-C Actions
    
    /// Invoked closure when user double clicks on item
    /// - Parameter sender: ignored
    @objc func tableViewDoubleAction(sender: AnyObject) {
        guard let event = doubleClickEvent else { return }
        
        event(clickedRow)
    }

}
