import DropBear

class ScrollableStackRobot: LaunchingRobot<NavigationController>, AccessibleRobot {
    typealias Element = AccessibilityIdentifiers.ScrollableStackViewController

    func pushTabBar() -> TabBarRobot<ScrollableStackRobot> {
        return tap(.button3).makeRobot()
    }
}
