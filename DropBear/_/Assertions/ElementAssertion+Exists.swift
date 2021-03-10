//
//  ElementAssertion+Exists.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-10.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

extension ElementAssertion {
    public static var exists: ElementAssertion {
        return exists(waiting: DropBear.defaultWaitTime)
    }

    public static func exists(waiting duration: TimeInterval) -> ElementAssertion {
        return .init(name: "exists", assert: { element in
            DropBear.poll(until: { element.exists }, timeout: duration)

            if element.exists {
                return .success("Element exists")
            } else {
                return .failure("Element does not exist")
            }
        })
    }

    public static var doesNotExist: ElementAssertion {
        return doesNotExist(waiting: DropBear.defaultWaitTime)
    }

    public static func doesNotExist(waiting duration: TimeInterval) -> ElementAssertion {
        return .init(name: "doesNotExist", assert: { element in
            DropBear.poll(until: { !element.exists }, timeout: duration)

            if element.exists {
                return .failure("Element exists")
            } else {
                return .success("Element does not exist")
            }
        })
    }
}
