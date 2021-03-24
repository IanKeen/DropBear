//
//  NavigationController.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-23.
//  Copyright © 2021 Mustard. All rights reserved.
//

public protocol NavigationHierarchy {
    associatedtype NavigationElement
    associatedtype Parent

    var parent: Parent { get }
}

public struct NoNavigationElement { }

public struct NavigationController<NavigationElement, Parent>: NavigationHierarchy {
    public let parent: Parent
}

extension NavigationController: TabItemHierarchy where Parent: TabItemHierarchy  {
    public var tabController: Parent.TabController { parent.tabController }
}
