import XCTest

extension XCUIElement {
    public var values: [String] {
        var potentials = [label, value as Any]
        
        switch elementType {
        case .segmentedControl:
            potentials.append(contentsOf: buttons.allElementsBoundByIndex
                .filter({ $0.isSelected })
                .flatMap({ [$0.label, $0.value as Any] }))
            
        default:
            break
        }

        return potentials.compactMap({ $0 as? String }).filter({ !$0.isEmpty })
    }
}
