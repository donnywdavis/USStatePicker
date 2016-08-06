//
//  USStatePicker.swift
//  Pods
//
//  Created by Donny Davis on 8/6/16.
//
//

import UIKit

public class USStatePicker: UIPickerView {
    
    private var states = [State]()
    
    public weak var statePickerDelegate: StatePickerDelegate?
    
    init() {
        super.init(frame: CGRect.zero)
        
        self.delegate = self
        self.dataSource = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func loadStates() {
        guard let statesDictionary = statePickerDelegate?.statePickerAvailableStates() else {
            self.states = [State]()
            return
        }
        
        let stateCodes = statesDictionary.map({ $0.0 }).sort()
        
        for state in stateCodes {
            states.append(State(code: state, name: statesDictionary[state]!))
        }
        
    }
    
}

extension USStatePicker: UIPickerViewDataSource {
    
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
}

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
