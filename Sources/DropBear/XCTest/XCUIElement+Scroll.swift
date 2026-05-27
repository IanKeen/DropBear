@preconcurrency import XCTest

extension XCUIElement {

    /// Scrolls `scrollView` up until this element is hittable, or `maxSwipes` is
    /// exhausted, then returns it so calls can chain
    /// (`card.scrollUntilHittable().tap()`). Check `.isHittable` on the result if
    /// you need to know whether it actually came on-screen.
    ///
    /// Prefer this over relying on XCUITest's implicit auto-scroll before a tap: in
    /// lazy/virtualized lists the implicit scroll can recycle the target cell
    /// mid-scroll and fail to re-resolve it. Scrolling it on-screen first means the
    /// tap never has to auto-scroll.
    @discardableResult
    public func scrollUntilHittable(in scrollView: XCUIElement = XCUIApplication(), maxSwipes: Int = 8) -> XCUIElement {
        var swipes = 0
        while !isHittable, swipes < maxSwipes {
            scrollView.swipeUp()
            swipes += 1
        }
        return self
    }

    /// Scrolls `scrollView` up until this element exists, or `maxSwipes` is
    /// exhausted, then returns it. Use when the target is lazily created and not in
    /// the hierarchy until scrolled near (existence, not hittability, is the signal).
    @discardableResult
    public func scrollUntilExists(in scrollView: XCUIElement = XCUIApplication(), maxSwipes: Int = 8) -> XCUIElement {
        var swipes = 0
        while !exists, swipes < maxSwipes {
            scrollView.swipeUp()
            swipes += 1
        }
        return self
    }
}
