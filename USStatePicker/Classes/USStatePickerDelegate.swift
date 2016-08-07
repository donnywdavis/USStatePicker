//
//  USStatePickerDelegate.swift
//  Pods
//
//  Created by Donny Davis on 8/6/16.
//
//

import UIKit

public protocol USStatePickerDelegate: class {
    func statePickerSelectedState(state: State)
    func statePickerColorForTitle() -> UIColor?
    func statePickerAvailableStates() -> [String: String]
    func statePickerTitleOptionForRow() -> StateRowTitleOption
}

public extension USStatePickerDelegate {
    
    func statePickerColorForTitle() -> UIColor? {
        return nil
    }
    
    func statePickerAvailableStates() -> [String: String] {
        return [
            "AL": "Alabama",
            "AK": "Alaska",
            "AZ": "Arizona",
            "AR": "Arkansas",
            "CA": "California",
            "CO": "Colorado",
            "CT": "Connecticut",
            "DE": "Delaware",
            "FL": "Florida",
            "GA": "Georgia",
            "HI": "Hawaii",
            "ID": "Idaho",
            "IL": "Illinois",
            "IN": "Indiana",
            "IA": "Iowa",
            "KS": "Kansas",
            "KY": "Kentucky",
            "LA": "Louisiana",
            "ME": "Maine",
            "MD": "Maryland",
            "MA": "Massachusetts",
            "MI": "Michigan",
            "MN": "Minnesota",
            "MS": "Mississippi",
            "MO": "Missouri",
            "MT": "Montana",
            "NE": "Nebraska",
            "NV": "Nevada",
            "NH": "New Hampshire",
            "NJ": "New Jersey",
            "NM": "New Mexico",
            "NY": "New York",
            "NC": "North Carolina",
            "ND": "North Dakota",
            "OH": "Ohio",
            "OK": "Oklahoma",
            "OR": "Oregon",
            "PA": "Pennsylvania",
            "RI": "Rhode Island",
            "SC": "South Carolina",
            "SD": "South Dakota",
            "TN": "Tennessee",
            "TX": "Texas",
            "UT": "Utah",
            "VT": "Vermont",
            "VA": "Virginia",
            "WA": "Washington",
            "WV": "West Virginia",
            "WI": "Wisconsin",
            "WY": "Wyoming"
        ]
    }
    
    func statePickerTitleOptionForRow() -> StateRowTitleOption {
        return .name
    }
    
}
