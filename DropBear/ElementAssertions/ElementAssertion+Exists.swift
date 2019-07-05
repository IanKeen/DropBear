extension ElementAssertion {
    public static var exists: ElementAssertion {
        return exists(waiting: DropBear.defaultWaitTime)
    }

    public static func exists(waiting duration: TimeInterval) -> ElementAssertion {
        return .init(name: "exists", assertion: { element in
            if element.exists { return true }
            return element.waitForExistence(timeout: duration)
        })
    }
}
