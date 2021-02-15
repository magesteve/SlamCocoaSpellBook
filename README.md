# SlamCocoaSpellBook

[![Swift](https://img.shields.io/badge/Swift-5-blue.svg)](https://swift.org)
[![macOS](https://img.shields.io/badge/os-macOS-blue.svg)](https://apple.com/mac)
[![Xcode](https://img.shields.io/badge/Xcode-12-blue.svg)](https://developer.apple.com/xcode)
[![SPM](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager)
[![MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Swift Package to provide Closure based functionality for Macintosh App Development (Cocoa).

## Installation

### Requirements

- MacOS 10.15
- Swift 5
- Xcode 11

### Repository

    https://github.com/magesteve/PreferencesSpellBook.git

## Components

### SlamButton Magic

SlamButton is a closure based version of standard NSButton. It supports the SlamActionable protocol, which can attaches a closure to the control. Pressing the button does not invoke a Target-Action, but instead executes the closure.

### SlamTextField Magic

SlamTextField is a closure based version of NSTextField. It supports the SlamTextInputable protocol, which can attaches a closure to the field. Changing the text in the field invokes the closure.

### SlamCheckbox & SlamSwitch Magic

SlamCheckbox & SlamSwitch are closures based version of CheckBox (NSButton) & NSSwitch. It supports the SlamSwitchable protocol, which can attaches two closures to the field. One closure returns the state of the control, while changing the state of the control invokes the other closure.

## License

PreferencesSpellBook is available as open source under the terms of the [MIT](https://github.com/magesteve/SlamCocoaSpellBook/blob/main/LICENSE) License.
