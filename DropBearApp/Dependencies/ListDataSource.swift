//
//  ListDataSource.swift
//  DropBearApp
//
//  Created by Ian Keen on 2021-03-08.
//  Copyright © 2021 Timberlane Labs. All rights reserved.
//

import Combine
import DomainKit

class LiveListDataSource: ListDataSource {
    private var created: [Identifier<ListItem>: Identified<ListItem>] = [:]
    
    func all() -> Future<[Identified<ListItem>], Error> {
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 2) {
                switch Int.random(in: 1...10) {
                case 1,7:
                    promise(.failure(ListDataSourceError.unableToRetrieve))

                default:
                    let random: [Identified<ListItem>] = (1...20).map { _ in
                        return .init(id: .init(rawValue: UUID().uuidString), value: .init(
                            title: String.random(length: 10),
                            createdOn: Date.random(),
                            completed: Bool.random()
                        ))
                    }
                    let result = random + self.created.values
                    promise(.success(result.shuffled()))
                }
            }
        }
    }

    func create(_ item: ListItem) -> Future<Identified<ListItem>, Error> {
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 2) {
                switch Int.random(in: 1...10) {
                case 1,7:
                    promise(.failure(ListDataSourceError.unableToUpdate))

                default:
                    let identifier = Identifier<ListItem>(rawValue: UUID().uuidString)
                    let identified = Identified(id: identifier, value: item)
                    self.created[identifier] = identified
                    promise(.success(identified))
                }
            }
        }
    }

    func update(_ item: Identified<ListItem>) -> Future<Identified<ListItem>, Error> {
        return Future { promise in
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 2) {
                switch Int.random(in: 1...10) {
                case 1,7:
                    promise(.failure(ListDataSourceError.unableToUpdate))

                default:
                    self.created[item.id] = item
                    promise(.success(item))
                }
            }
        }
    }
}

private extension String {
    private static let chars = "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ "

    static func random(length: Int) -> String {
        return String((0..<length).map({ _ in chars.randomElement()! }))
    }
}
private extension Date {
    static let day = (60 * 60 * 24)

    static func random() -> Date {
        let randomTimeInDay = Int.random(in: 0...day)
        let randomDayInWeek = Int.random(in: 0...7)

        let random = (day * randomDayInWeek) + randomTimeInDay
        return Date().addingTimeInterval(-TimeInterval(random))
    }
}
