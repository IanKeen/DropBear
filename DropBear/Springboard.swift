import XCTest

extension Springboard.DeleteAppButton {
    public static var `default`: Springboard.DeleteAppButton {
        return .init { application, icon in
            let ios13button = iOS13.element(application, icon)
            if ios13button.exists { return ios13button }
            return iOS12.element(application, icon)
        }
    }

    public static var iOS12: Springboard.DeleteAppButton {
        return .init { application, icon in
            // find X
            let iconFrame = icon.frame
            let iconDeleteOffset = CGVector(
                dx: (iconFrame.minX + 3) / application.frame.maxX,
                dy: (iconFrame.minY + 3) / application.frame.maxY
            )

            application
                .coordinate(withNormalizedOffset: iconDeleteOffset)
                .tap()

            return application.alerts.buttons["Delete"]
        }
    }

    public static var iOS13: Springboard.DeleteAppButton {
        return .init { application, _ in
            return application.buttons["Delete App"]
        }
    }
}

public enum Springboard {
    static let application = XCUIApplication(bundleIdentifier: "com.apple.springboard")

    public static func deleteApp(named name: String, using button: DeleteAppButton = .default, required: Bool = false, file: StaticString = #file, line: UInt = #line) {
        let icon = application.icons[name]
        let iconAvailable = icon.waitForExistence(timeout: DropBear.defaultWaitTime) && icon.isHittable

        // Icon isn't there, but we don't need it to be.
        if !required && !iconAvailable { return }

        guard iconAvailable else {
            return XCTFail("Application icon named '\(name)' not found.", file: file, line: line)
        }

        // Long press
        icon.press(forDuration: 1.5)

        // find delete button
        let deleteButton = button.element(application, icon)
        let deleteButtonAvailable = deleteButton.waitForExistence(timeout: DropBear.defaultWaitTime) && deleteButton.isHittable

        guard deleteButtonAvailable else {
            return XCTFail("Failed to tap the app icons delete button.", file: file, line: line)
        }

        deleteButton.tap()
        XCUIDevice.shared.press(.home)
    }
}

extension Springboard {
    public struct DeleteAppButton {
        public typealias Input = (_ application: XCUIApplication, _ icon: XCUIElement) -> XCUIElement

        let element: Input

        public init(element: @escaping Input) {
            self.element = element
        }
    }
}
