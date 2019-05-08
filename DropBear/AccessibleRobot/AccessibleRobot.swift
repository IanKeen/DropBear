/// An `AccessibleRobot` represents the actions that can be performed on a given screen.
/// The elements for these robots are accessed in a type-safe way via an `Element` type
/// whose values are linked to the elements accessibility identifiers.
public protocol AccessibleRobot: Robot {
    associatedtype Element: RawRepresentable where Element.RawValue == String
}
