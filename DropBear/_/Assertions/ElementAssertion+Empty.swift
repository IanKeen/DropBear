//
//  ElementAssertion+Empty.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

extension ElementAssertion {
    public static var isEmpty: ElementAssertion {
        return .init(name: #function, assert: { element in
            switch element.value {
            case nil:
                return .success("Element is empty")

            case let value as String:
                // Includes placeholder workaround for: http://www.openradar.me/34505268
                let result = value.isEmpty || element.placeholderValue == value
                return result
                    ? .success("Element is empty")
                    : .failure("Elements value is \"\(value)\"")

            case let value?:
                return .failure("Unable to test emptiness. Unsupported type '\(type(of: value))'")
            }
        })
    }

    public static var isNotEmpty: ElementAssertion {
        return .init(name: #function, assert: { element in
            switch element.value {
            case nil:
                return .failure("Element is empty")

            case let value as String:
                // Includes placeholder workaround for: http://www.openradar.me/34505268
                let result = value.isEmpty || element.placeholderValue == value
                return result
                    ? .failure("Element is empty")
                    : .success("Elements value is \"\(value)\"")

            case let value?:
                return .failure("Unable to test emptiness. Unsupported type '\(type(of: value))'")
            }
        })
    }
}
