//
//  Publisher+Result.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-07.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine

typealias AnyResultPublisher<T, E: Error> = AnyPublisher<Result<T, E>, Never>

extension Publisher {
    func asResult() -> AnyResultPublisher<Output, Failure> {
        return map(Result.success)
            .catch { Just(Result.failure($0)) }
            .eraseToAnyPublisher()
    }
}

extension Publisher {
    func values<S, F: Error>() -> AnyPublisher<S, Never> where Output == Result<S, F>, Failure == Never {
        return flatMap { result -> AnyPublisher<S, Never> in
            switch result {
            case .success(let value):
                return Just(value).eraseToAnyPublisher()

            case .failure:
                return Empty().eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }

    func errors<S, F: Error>() -> AnyPublisher<F, Never> where Output == Result<S, F>, Failure == Never {
        return flatMap { result -> AnyPublisher<F, Never> in
            switch result {
            case .success:
                return Empty().eraseToAnyPublisher()

            case .failure(let error):
                return Just(error).eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
}

extension Publisher {
    func mapResult<S, F: Error, T>(_ transform: @escaping @autoclosure () -> T) -> AnyPublisher<Result<T, F>, Never> where Output == Result<S, F>, Failure == Never {
        return map({ $0.map { _ in transform() } }).eraseToAnyPublisher()
    }
    func mapResult<S, F: Error, T>(_ transform: @escaping (S) -> T) -> AnyPublisher<Result<T, F>, Never> where Output == Result<S, F>, Failure == Never {
        return map({ $0.map(transform) }).eraseToAnyPublisher()
    }
    func flatMapResult<S, F: Error, T>(_ transform: @escaping (S) -> AnyPublisher<Result<T, F>, Never>) -> AnyPublisher<Result<T, F>, Never> where Output == Result<S, F>, Failure == Never {
        return flatMap { result -> AnyPublisher<Result<T, F>, Never> in
            switch result {
            case .success(let value):
                return transform(value)

            case .failure(let error):
                return Just(.failure(error)).eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
}
