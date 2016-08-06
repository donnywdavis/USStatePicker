# USStatePicker

<!--[![CI Status](http://img.shields.io/travis/Donny Davis/USStatePicker.svg?style=flat)](https://travis-ci.org/Donny Davis/USStatePicker)-->
[![Version](https://img.shields.io/cocoapods/v/USStatePicker.svg?style=flat)](http://cocoapods.org/pods/USStatePicker)
[![License](https://img.shields.io/cocoapods/l/USStatePicker.svg?style=flat)](http://cocoapods.org/pods/USStatePicker)
[![Platform](https://img.shields.io/cocoapods/p/USStatePicker.svg?style=flat)](http://cocoapods.org/pods/USStatePicker)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

USStatePicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "USStatePicker"
```

## Usage

To use the state picker first import it into your file.

`import USStatePicker`

Once the picker has been imported create a property to set up the delegate and load the states.

```swift
lazy var statePicker: StatePicker = {
    let picker = StatePicker()
    picker.statePickerDelegate = self
    picker.loadStates()
    return picker
}()
```

After the picker has been initialized then set it as the input view for a text field that will hold
the returned state.

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    statesTextField.inputView = statePicker
}
```

Once the picker is set up there is one required delegate method that needs to be implemented. That
method will return the state that is selected in the picker. The method will receive a State object
that has two properties. One for the states name and one for the two character state code.

```swift
extension ViewController: StatePickerDelegate {

    func statePickerSelectedState(state: State) {
        statesTextField.text = state.code
    }

}
```

There are three optional delegate methods that you can use to customize the picker. 
* The first method can be used to modify the states that are available in the picker. If you don't need all 50 states you can use this method to customize the picker for only the states that you need displayed. The format of the dictionary passed will be the two character code as the key and the state name as the value.
* The second method can be used to change the text color in the picker. If this method is not used then the text will default to black.
* The third method can be used to choose how the state is displayed in the picker. You can choose to display the state name or the two character state code. The default for this is the state name.

```swift
extension ViewController: StatePickerDelegate {

    // (1)
    func statePickerAvailableStates() -> [String : String] {
        return ["GA": "Georgia", "NC": "North Carolina"]
    }

    // (2)
    func statePickerColorForTitle() -> UIColor? {
        return UIColor.redColor()
    }

    // (3)
    func statePickerTitleOptionForRow() -> StateRowTitleOption {
        return StateRowTitleOption.code
    }

}
```
