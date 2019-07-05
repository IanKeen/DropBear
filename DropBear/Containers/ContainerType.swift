public protocol ContainerType { }

public protocol NavigationControllerType: ContainerType { }
public protocol TabBarControllerType: ContainerType { }

public enum Containers {
    public enum None: ContainerType { }

    public enum TabBarController_And_NavigationController: TabBarControllerType, NavigationControllerType { }
}

