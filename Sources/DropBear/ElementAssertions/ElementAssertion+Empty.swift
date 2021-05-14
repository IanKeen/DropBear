extension ElementAssertion {
    public static var isEmpty: ElementAssertion {
        return .init(name: #function, assertion: { element in
            switch element.value {
            case nil:
                return true

            case let value as String:
                // Includes placeholder workaround for: http://www.openradar.me/34505268
                return value.isEmpty || element.placeholderValue == value

            case let value?:
                fatalError("Unable to test emptiness. Unsupported type '\(type(of: value))'")
            }
        })
    }
}
