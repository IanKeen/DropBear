import XCTest
import DropBear

class Tests: UITest {
    func testContactsPermission() {
        Springboard.deleteApp(named: "DropBearApp", required: false)

        ScrollableStackRobot.launch()
            .assert(.label, .equal(to: "Undecided"))
            .tap(.button)
            .alert(.contactsPermission, required: true)
            .tap(.ok)
            .assert(.label, .equal(to: "Allowed"))
    }
    func testSwitch() {
        ScrollableStackRobot.launch()
            .assert(.switch, .equal(to: true))
            .tap(.switch)
            .assert(.switch, .equal(to: false))
    }
    func testSegment() {
        // hacked.. I added a11y id to xml directly.. IB doesn't appear to support it for some reason
        ScrollableStackRobot.launch()
            .assert(.segment, .equal(to: "first"))
            .tap(.segment, index: 1)
            .assert(.segment, .equal(to: "second"))
            .tap(.segment, index: 0)
            .assert(.segment, .equal(to: "first"))
    }
    func testSlider() {
        ScrollableStackRobot.launch()
            .assert(.slider, .equal(to: "50%"))
            .adjust(.slider, to: 0)
            .assert(.slider, .equal(to: "0%"))
            .adjust(.slider, to: 1)
            .assert(.slider, .equal(to: "100%"))
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
}
