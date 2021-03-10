//
//  ElementAssertion+Enabled.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Mustard. All rights reserved.
//

extension ElementAssertion {
    public static var isEnabled: ElementAssertion {
        return .init(name: #function, assert: { element in
            return element.isEnabled
                ? .success("Element is enabled")
                : .failure("Element is disabled")
        })
    }

    public static var isDisabled: ElementAssertion {
        return .init(name: #function, assert: { element in
            return !element.isEnabled
                ? .success("Element is disabled")
                : .failure("Element is enabled")
        })
    }
}
