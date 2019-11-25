extension ElementAssertion {
    public static var isEnabled: ElementAssertion {
        return .init(name: #function, assertion: { element in
            return element.isEnabled
        })
    }
}
