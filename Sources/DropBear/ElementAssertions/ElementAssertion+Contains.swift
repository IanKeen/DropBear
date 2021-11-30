extension ElementAssertion {
    public static func contains(_ value: String) -> ElementAssertion {
        return .init(name: "contains(\(value))", assertion: { element in
            return element
                .values
                .contains(where: { $0.lowercased().contains(value.lowercased()) })
        })
    }
}
