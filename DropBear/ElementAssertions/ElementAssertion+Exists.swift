extension ElementAssertion {
    public static var exists: ElementAssertion {
        return exists(waiting: DropBear.defaultWaitTime)
    }

    public static func exists(waiting duration: TimeInterval) -> ElementAssertion {
        return .init(name: "exists", assertion: { element in
            DropBear.poll(until: { element.exists }, timeout: duration)
            return element.exists
        })
    }

    public static var doesNotExist: ElementAssertion {
        return doesNotExist(waiting: DropBear.defaultWaitTime)
    }

    public static func doesNotExist(waiting duration: TimeInterval) -> ElementAssertion {
        return .init(name: "doesNotExist", assertion: { element in
            DropBear.poll(until: { !element.exists }, timeout: duration)
            return !element.exists
        })
    }
}
