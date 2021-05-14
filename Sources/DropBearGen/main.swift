import Foundation

func execute(input: Path, output: Path) throws {
    let coordinator = ExtractorCoordinator(extractors: [InterfaceBuilderExtractor(), SyntaxExtractor()])
    let identifiers = try coordinator.extract(from: input)
    let generator = Generator(identifiers: identifiers)
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
