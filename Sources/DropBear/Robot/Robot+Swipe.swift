@preconcurrency import XCTest

extension Robot where Self: Actionable {

    @discardableResult
    public func swipeUp() -> Self {
        source.swipeUp()
        return self
    }

    @discardableResult
    public func swipeDown() -> Self {
        source.swipeDown()
        return self
    }

    @discardableResult
    public func swipeLeft() -> Self {
        source.swipeLeft()
        return self
    }

    @discardableResult
    public func swipeRight() -> Self {
        source.swipeRight()
        return self
    }

    /// Swipes down to trigger a pull-to-refresh on the current screen.
    @discardableResult
    public func pullToRefresh() -> Self {
        source.swipeDown()
        return self
    }
}
