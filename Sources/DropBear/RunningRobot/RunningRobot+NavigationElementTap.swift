import XCTest

extension RunningRobot where Context: NavigationControllerContext, Context.NavigationElement: RawRepresentable, Context.NavigationElement.RawValue == String {
    @discardableResult
    public func tap(
        _ element: Context.NavigationElement,
        in hierarchy: [XCUIElement.ElementType] = [.any],
        file: StaticString = #file, line: UInt = #line
        ) -> Self
    {
        element.element(in: source, hierarchy: hierarchy, file: file, line: line).tap()
        return self
    }
}
