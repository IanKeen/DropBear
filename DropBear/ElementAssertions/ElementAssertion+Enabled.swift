extension ElementAssertion {
    public static var enabled: ElementAssertion {
        return .init(name: "enabled", assertion: { element in
            return element.isEnabled
        })
    }
}
