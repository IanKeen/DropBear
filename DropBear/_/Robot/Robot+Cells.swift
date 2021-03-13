//
//  Robot+Cells.swift
//  DropBear
//
//  Created by Ian Keen on 2021-03-11.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

public enum AnyCellItem { }

public protocol CellContainerRobot: Robot {
    associatedtype CellItem = AnyCellItem
}
