//
//  Simulator.swift
//  DropBearSupport
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Mustard. All rights reserved.
//

import UIKit

// Original Source: https://stackoverflow.com/a/61339150

public func requireSoftwareKeyboard() {
    #if targetEnvironment(simulator)
    // Disable hardware keyboards.
    let setHardwareLayout = NSSelectorFromString("setHardwareLayout:")
    UITextInputMode.activeInputModes
        // Filter `UIKeyboardInputMode`s.
        .filter({ $0.responds(to: setHardwareLayout) })
        .forEach { $0.perform(setHardwareLayout, with: nil) }
    #endif
}
