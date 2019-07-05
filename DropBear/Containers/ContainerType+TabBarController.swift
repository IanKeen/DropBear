extension Containers {
    public enum TabBarController: TabBarControllerType { }
}

extension RunningRobot where Container: TabBarControllerType {
    public func backToTabBarController(file: StaticString = #file, line: UInt = #line) -> Previous {
        return previous
    }
}
