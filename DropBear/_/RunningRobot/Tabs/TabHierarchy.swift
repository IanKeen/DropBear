//
//  TabHierarchy.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-23.
//  Copyright © 2021 Mustard. All rights reserved.
//

public protocol TabBarHierarchy { }

public struct TabBarController: TabBarHierarchy { }

public protocol TabItemHierarchy {
    associatedtype TabController

    var tabController: TabController { get }
}

public struct TabItem<TabController>: TabItemHierarchy {
    public let tabController: TabController
}
