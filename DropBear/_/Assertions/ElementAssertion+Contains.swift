//
//  ElementAssertion+Contains.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

extension ElementAssertion {
    public static func contains<T: TestValue>(_ value: T, using contains: TestValueContains = .caseInsensitive) -> ElementAssertion {
        return .init(name: "contains(\"\(value)\")", assert: { element in
            let elementValues = element.values

            let match = elementValues.contains(where: { elementValue in
                return value.stringValues.contains(where: { contains.contains(elementValue, $0) })
            })

            if match {
                return .success("\"\(value)\" is contained in one of \(elementValues)")
            } else {
                return .failure("\"\(value)\" is not contained in any of \(elementValues)")
            }
        })
    }
}
