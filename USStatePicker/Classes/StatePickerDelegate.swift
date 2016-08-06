//
//  StatePickerDelegate.swift
//  Pods
//
//  Created by Donny Davis on 8/6/16.
//
//

import UIKit

public protocol StatePickerDelegate: class {
    func statePickerSelectedState(state: State)
    func statePickerColorForTitle() -> UIColor?
    func statePickerAvailableStates() -> [String: String]
    func statePickerTitleOptionForRow() -> StateRowTitleOption
}

extension StatePickerDelegate {
    
    func statePickerColorForTitle() -> UIColor? {
        return nil
    }
    
    func statePickerAvailableStates() -> [String: String] {
        return ["CA": "California", "FL": "Florida", "GA": "Georgia", "NC": "North Carolina"]
    }
    
    func statePickerTitleOptionForRow() -> StateRowTitleOption {
        return .name
    }
    
}
