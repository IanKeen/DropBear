//
//  ElementAssertion+Equal.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

extension ElementAssertion {
    public static func equals<T: TestValue>(_ value: T, using equality: TestValueEquality = .caseInsensitive) -> ElementAssertion {
        return .init(name: "equals(\"\(value)\")", assert: { element in
            let elementValues = element.values

            let match = elementValues.contains(where: { elementValue in
                return value.stringValues.contains(where: { equality.equal($0, elementValue) })
            })

            if match {
                return .success("\"\(value)\" is equal to one of \(elementValues)")
            } else {
                return .failure("\"\(value)\" is not equal to any of \(elementValues)")
            }
        })
    }

    public static func placeholderEquals<T: TestValue>(_ value: T, using equality: TestValueEquality = .caseInsensitive) -> ElementAssertion {
        return .init(name: "placeholderEquals(\"\(value)\")", assert: { element in
            let elementValue = element.placeholderValue ?? ""

            let match = value.stringValues.contains(where: { equality.equal($0, elementValue) })

            if match {
                return .success("\"\(value)\" is equal to \"\(elementValue)\"")
            } else {
                return .failure("\"\(value)\" is not equal to \"\(elementValue)\"")
            }
        })
    }
}
