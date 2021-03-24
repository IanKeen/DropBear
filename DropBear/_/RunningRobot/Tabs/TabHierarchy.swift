//
//  TabHierarchy.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-23.
//  Copyright © 2021 Mustard. All rights reserved.
//

public protocol TabBarHierarchy {
    associatedtype Parent

    var parent: Parent { get }
}

public struct TabBarController<Parent>: TabBarHierarchy {
    public let parent: Parent
}

public protocol TabItemHierarchy {
    associatedtype Parent
    associatedtype TabController

    var parent: Parent { get }
    var tabController: TabController { get }
}

public struct TabItem<Parent, TabController>: TabItemHierarchy {
    public let parent: Parent
    public let tabController: TabController
}
