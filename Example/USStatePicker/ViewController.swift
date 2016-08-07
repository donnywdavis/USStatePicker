//
//  ViewController.swift
//  USStatePicker
//
//  Created by Donny Davis on 08/06/2016.
//  Copyright (c) 2016 Donny Davis. All rights reserved.
//

import UIKit
import USStatePicker

class ViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var stateTextField: UITextField!
    
    // MARK: Properties
    
    lazy var statePicker: USStatePicker = {
        let picker = USStatePicker(frame: CGRect.zero)
        picker.statePickerDelegate = self
        picker.loadStates()
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the state picker as the input view for the text field
        stateTextField.inputView = statePicker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: USStatePickerDelegate

extension ViewController: USStatePickerDelegate {
    
    // Get the selected state and display the state code in the text field.
    // Use the name property to display the state name instead of the state code.
    func statePickerSelectedState(state: State) {
        stateTextField.text = state.code
    }
    
    // Uncomment this method modify the states that are displayed in the picker
//    func statePickerAvailableStates() -> [String : String] {
//        return ["CA": "California", "FL": "Florida", "GA": "Georgia", "NC": "North Carolina"]
//    }
    
    // Uncomment this method to change how the state is displayed in the picker.
    // Choose whether it is displayed by state name or state code
//    func statePickerTitleOptionForRow() -> StateRowTitleOption {
//        return StateRowTitleOption.code
//    }
    
    // Uncomment this method to change the color of the state title in the picker
//    func statePickerColorForTitle() -> UIColor? {
//        return UIColor.redColor()
//    }
    
}

