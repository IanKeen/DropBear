//
//  Publisher+Extensions.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-07.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine

extension Publisher {
    func withLatestFrom<P: Publisher>(_ other: P) -> AnyPublisher<P.Output, Failure> where Failure == P.Failure {
        return other.map({ value in self.map { _ in value } }).switchToLatest().eraseToAnyPublisher()
    }

    func withLatestFrom<P: Publisher, T>(_ other: P, transform: @escaping (Output, P.Output) -> T) -> AnyPublisher<T, Failure> where Failure == P.Failure {
        return other.map({ second in self.map { first in transform(first, second) } }).switchToLatest().eraseToAnyPublisher()
    }
}

extension Publisher {
    func flatMapLatest<P: Publisher>(_ transform: @escaping (Output) -> P) -> Publishers.SwitchToLatest<P, Publishers.Map<Self, P>> {
        return map(transform).switchToLatest()
    }
}

extension Publisher where Failure == Never {
    func filter<P: Publisher>(_ publisher: P) -> AnyPublisher<Output, Failure> where P.Output == Bool, P.Failure == Never {
        return withLatestFrom(publisher, transform: { ($0, $1) }).filter({ $0.1 }).map({ $0.0 }).eraseToAnyPublisher()
    }
}

extension Publisher {
    func routeErrors(_ closure: @escaping (Failure) -> Void) -> AnyPublisher<Output, Never> {
        return asResult()
            .handleEvents(receiveOutput: { result in
                switch result {
                case .success:
                    break
                case .failure(let error):
                    closure(error)
                }
            })
            .values()
    }
    func routeErrors<T: AnyObject>(to object: T, _ keyPath: ReferenceWritableKeyPath<T, Error?>) -> AnyPublisher<Output, Never> {
        return routeErrors { [weak object] error in
            guard let object = object else { return }
            object[keyPath: keyPath] = error
        }
    }
}

extension Publisher {
    func globalEffect(storeIn set: inout Set<AnyCancellable>) {
        return sink(receiveCompletion: { _ in }, receiveValue: { _ in }).store(in: &set)
    }
}

extension Publisher {
    func withPrevious() -> AnyPublisher<(Output?, Output), Failure> {
        return scan((Optional<Output>.none, Optional<Output>.none)) { ($0.1, $1) }
            .compactMap { value in
                guard let new = value.1 else { return nil }
                return (value.0, new)
            }
            .eraseToAnyPublisher()
    }
}
