@preconcurrency import XCTest

extension Robot {
    /// Scrolls `source` up until the element for `key` is hittable (or `maxSwipes`
    /// is exhausted), then returns self.
    @discardableResult
    public func scrollTo(
        _ key: Element,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        maxSwipes: Int = 8,
        file: StaticString = #filePath, line: UInt = #line
        ) -> Self
    {
        _ = element(key, in: hierarchy, file: file, line: line)
            .scrollUntilHittable(in: source, maxSwipes: maxSwipes)
        return self
    }
}

extension Robot where Self: Actionable {
    /// Taps the element for `key`, first scrolling it on-screen if needed. Prefer
    /// this over relying on XCUITest's implicit auto-scroll in lazy lists.
    @discardableResult
    public func tap(
        _ key: Element,
        scrollIfNeeded: Bool,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        maxSwipes: Int = 8,
        file: StaticString = #filePath, line: UInt = #line
        ) -> Self
    {
        let resolved = element(key, in: hierarchy, file: file, line: line)
        if scrollIfNeeded {
            _ = resolved.scrollUntilHittable(in: source, maxSwipes: maxSwipes)
        }
        resolved.tap()
        return self
    }
}
