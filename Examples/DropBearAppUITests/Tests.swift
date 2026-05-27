import XCTest
import DropBear

class Tests: UITest {
    func testContactsPermission() {
        Springboard.deleteApp(named: "DropBearApp", required: false)

        ScrollableStackRobot.launch()
            .assert(.label, .isEqual(to: "Undecided"))
            .tap(.button)
            .alert(.contactsPermission)
            .tap(.continue)
            .alert(.contactsSharing, required: false)
            .tap(.shareAll)
            .assert(.label, .isEqual(to: "Allowed"))
    }
    func testSwitch() {
        ScrollableStackRobot.launch()
            .assert(.switch, .isEqual(to: true))
            .tap(.switch)
            .assert(.switch, .isEqual(to: false))
    }
    func testSegment() {
        // hacked.. I added a11y id to xml directly.. IB doesn't appear to support it for some reason
        ScrollableStackRobot.launch()
            .assert(.segment, .isEqual(to: "first"))
            .tap(.segment, index: 1)
            .assert(.segment, .isEqual(to: "second"))
            .tap(.segment, index: 0)
            .assert(.segment, .isEqual(to: "first"))
    }
    func testSlider() {
        ScrollableStackRobot.launch()
            .assert(.slider, .isEqual(to: "50%"))
            .adjust(.slider, to: 0)
            .assert(.slider, .isEqual(to: "0%"))
            .adjust(.slider, to: 1)
            .assert(.slider, .isEqual(to: "100%"))
    }
    func testTest() {
        ScrollableStackRobot.launch()
            .assert(.button, .exists)
            .pushTabBar()
            .selectTab2()
            .assert(.tab2button, .exists)
            .pushTableViewController()
            .tapCell()
            .popNavigationController()
            .assert(.tab2button, .exists)
            .backToTabBarController()
            .selectTab1()
            .assert(.tab1button, .exists)
    }
    func testNavigationTitleMatcher() {
        ScrollableStackRobot.launch()
            .assert(.navigationTitle, .isEqual(to: "Home"))
            .assert(.label, .exists)
    }
    func testMatchesEvaluatesWithoutFailing() {
        let robot = ScrollableStackRobot.launch()
        XCTAssertTrue(robot.matches(.label, .exists))
        XCTAssertTrue(robot.matches(.label, .isEqual(to: "Undecided")))
        XCTAssertFalse(robot.matches(.label, .isEqual(to: "Not the label text")))
    }
    func testElementContainingText() {
        let robot = ScrollableStackRobot.launch()
        XCTAssertTrue(robot.element(containingText: "ndecide", type: .staticText).exists)
        XCTAssertFalse(robot.element(containingText: "no such text here", type: .staticText).exists)
    }
}
