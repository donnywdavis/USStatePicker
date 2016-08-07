//
//  USStatePicker.swift
//  Pods
//
//  Created by Donny Davis on 8/6/16.
//
//

import UIKit

public class USStatePicker: UIPickerView {
    
    // MARK: Properties
    
    private var states = [State]()    
    public weak var statePickerDelegate: USStatePickerDelegate?
    
    // MARK: Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.delegate = self
        self.dataSource = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Load States
    
    public func loadStates() {
        guard let statesDictionary = statePickerDelegate?.statePickerAvailableStates() else {
            self.states = [State]()
            return
        }
        
        // Build our array of available states to display
        for (code, name) in statesDictionary {
            states.append(State(code: code.uppercaseString, name: name))
        }
        
        // Sort the states depending on which option is selected for the picker title.
        if let titleOption = statePickerDelegate?.statePickerTitleOptionForRow() {
            switch titleOption {
            case .code:
                self.states.sortInPlace({ $0.code < $1.code })
            case .name:
                self.states.sortInPlace({ $0.name < $1.name })
            }
        }
    }
    
}

// MARK: Picker View Data Source

extension USStatePicker: UIPickerViewDataSource {
    
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
}

// MARK: Picker View Delegate

extension USStatePicker: UIPickerViewDelegate {
    
    public func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let stateRowTitle = statePickerDelegate?.statePickerTitleOptionForRow() else {
            return nil
        }
        
        switch stateRowTitle {
        case .code:
            return states[row].code
        case .name:
            return states[row].name
        }
        
    }
    
    public func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        guard let titleColor = statePickerDelegate?.statePickerColorForTitle() else {
            return nil
        }
        
        guard let stateRowTitle = statePickerDelegate?.statePickerTitleOptionForRow() else {
            return nil
        }
        
        switch stateRowTitle {
        case .code:
            return NSAttributedString(string: states[row].code!, attributes: [NSForegroundColorAttributeName: titleColor])
        case .name:
            return NSAttributedString(string: states[row].name!, attributes: [NSForegroundColorAttributeName: titleColor])
        }
        
    }
    
    public func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerDelegate?.statePickerSelectedState(states[row])
    }
    
}
