extension ElementAssertion {
    public static func contains(_ value: String) -> ElementAssertion {
        return .init(name: "contains(\(value))", assertion: { element in
            let potentials = [element.label, element.value as Any]

            return potentials
                .compactMap { $0 as? String }
                .contains(where: { $0.lowercased().contains(value.lowercased()) })
        })
    }
}
