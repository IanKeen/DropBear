//
//  MemoryManagement.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-07.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine

func weak<T: AnyObject, I>(_ object: T, _ closure: @escaping (T, I) -> Void) -> (I) -> Void {
    return { [weak object] value in
        guard let object = object else { return }
        closure(object, value)
    }
}

func weak<T: AnyObject, I>(_ object: T, _ closure: @escaping (T) -> (I) -> Void) -> (I) -> Void {
    return { [weak object] value in
        guard let object = object else { return }
        closure(object)(value)
    }
}


func weak<T: AnyObject, I, P: Publisher>(_ object: T, _ closure: @escaping (T, I) -> P) -> (I) -> AnyPublisher<P.Output, P.Failure> {
    return { [weak object] value in
        guard let object = object else { return Empty().eraseToAnyPublisher() }

        return closure(object, value).eraseToAnyPublisher()
    }
}
