import Foundation

func execute(input: Path, output: Path) throws {
    let parser = Parser()
    try parser.parse(path: input)

    let generator = Generator(identifierData: parser.accessibilityIdentifiers)
    try generator.generate(path: output)
}

enum CommandError: Swift.Error {
    case invalidArguments
}

do {
    guard
        let input = CommandLine.arguments[safe: 1],
        let output = CommandLine.arguments[safe: 2]
        else { throw CommandError.invalidArguments }

    try execute(input: Path(input), output: Path(output))

} catch let error {
    let string = """
    ERROR: \(error)
    Arguments: \(CommandLine.arguments)
    """

    fputs(string + "\n", stderr)
    exit(-1)
}
