import XCTest

public protocol CellContainerRobot: _Robot { }

extension _RunningRobot: CellContainerRobot where Current: CellContainerRobot { }

extension _RunningRobot where Current: CellContainerRobot {
    public func nextRobot<Next: _Robot>(_: Next.Type = Next.self, forCell index: Int, action: RootAction, file: StaticString = #file, line: UInt = #line) -> RootRobot<Next> {
        return tap(cell: index, file: file, line: line).nextRobot(action: action)
    }

    public func nextRobot<NavigationElement, Next: _Robot>(_: Next.Type = Next.self, forCell index: Int, action: NavigationAction, file: StaticString = #file, line: UInt = #line) -> NavigationRobot<NavigationElement, Next> {
        return tap(cell: index, file: file, line: line).nextRobot(action: action)
    }

    public func nextRobot<NavigationElement, Next: _Robot>(_: Next.Type = Next.self, forCell index: Int, action: ModalAction, file: StaticString = #file, line: UInt = #line) -> ModalRobot<NavigationElement, Next> {
        return tap(cell: index, file: file, line: line).nextRobot(action: action)
    }
}

extension _Robot where Self: CellContainerRobot {
    public func tap(cell index: Int, file: StaticString = #file, line: UInt = #line) -> Self {
        cell(index, file: file, line: line).tap()
        return self
    }

    public func cell(_ index: Int, file: StaticString = #file, line: UInt = #line) -> XCUIElement {
        DropBear.poll(until: { source.cells.count > 0 }, timeout: DropBear.defaultWaitTime)

        if source.cells.count == 0 {
            XCTFail("No cells found", file: file, line: line)
        }

        if index < 0 || index >= source.cells.count {
            XCTFail("Invalid cell index. Value should be between 0 and \(source.cells.count - 1)", file: file, line: line)
        }

        return source.cells.element(boundBy: index)
    }
}
