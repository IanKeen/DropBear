extension ElementAssertion {
    public static func isEqual<T: UITestEquatable>(to value: T) -> ElementAssertion {
        return .init(name: "isEqual(to: \(value))", assertion: { element in
            return element.values.contains(where: { elementValue in
                return value.stringValues.contains(where: { $0.lowercased() == elementValue.lowercased() })
            })
        })
    }

    public static func placeholderEqual<T: UITestEquatable>(to value: T) -> ElementAssertion {
        return .init(name: "placeholderEqual(to: \(value))", assertion: { element in
            return value.stringValues.contains(where: { $0.lowercased() == element.placeholderValue?.lowercased() })
        })
    }
}

public protocol UITestEquatable {
    var stringValues: [String] { get }
}

extension Bool: UITestEquatable {
    public var stringValues: [String] {
        switch self {
        case true: return ["1"]
        case false: return ["0"]
        }
    }
}

extension UITestEquatable where Self: LosslessStringConvertible {
    public var stringValues: [String] { return [description] }
}
extension Int: UITestEquatable { }
extension Double: UITestEquatable { }
extension String: UITestEquatable { }
