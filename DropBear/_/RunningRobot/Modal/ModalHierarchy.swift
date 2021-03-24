//
//  ModalHierarchy.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-23.
//  Copyright © 2021 Mustard. All rights reserved.
//

public protocol ModalHierarchy {
    associatedtype Presenter
    associatedtype Content

    var presenter: Presenter { get }
    var content: Content { get }
}

public struct Modal<Presenter, Content>: ModalHierarchy {
    public let presenter: Presenter
    public let content: Content
}

extension Modal: NavigationHierarchy where Content: NavigationHierarchy {
    public typealias NavigationElement = Content.NavigationElement

    public var parent: Content.Parent { content.parent }
}

extension Modal: NavigationItemHierarchy where Content: NavigationItemHierarchy {
    public var parent: Content.Parent { content.parent }
    public var root: Content.Root { content.root }
    public var previous: Content.Previous { content.previous }
}
