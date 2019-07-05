import XCTest

public enum Springboard {
    static let application = XCUIApplication(bundleIdentifier: "com.apple.springboard")

    public static func deleteApp(named name: String, required: Bool = false, file: StaticString = #file, line: UInt = #line) {
        let icon = application.icons[name]
        let iconAvailable = icon.waitForExistence(timeout: DropBear.defaultWaitTime) && icon.isHittable

        // Icon isn't there, but we don't need it to be.
        if !required && !iconAvailable { return }

        guard iconAvailable else {
            return XCTFail("Application icon named '\(name)' not found.", file: file, line: line)
        }

        icon.press(forDuration: 1.5)

        let iconFrame = icon.frame
        let iconDeleteOffset = CGVector(
            dx: (iconFrame.minX + 3) / application.frame.maxX,
            dy: (iconFrame.minY + 3) / application.frame.maxY
        )

        application
            .coordinate(withNormalizedOffset: iconDeleteOffset)
            .tap()

        let deleteButton = application.alerts.buttons["Delete"]
        let deleteButtonAvailable = deleteButton.waitForExistence(timeout: DropBear.defaultWaitTime) && deleteButton.isHittable

        guard deleteButtonAvailable else {
            return XCTFail("Failed to tap the app icons delete button.", file: file, line: line)
        }

        deleteButton.tap()
        XCUIDevice.shared.press(.home)
    }
}
