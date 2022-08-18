import Foundation

func execute(input: Path, output: Path) throws {
    let coordinator = ExtractorCoordinator(extractors: [InterfaceBuilderExtractor(), SyntaxExtractor()])
    let identifiers = try coordinator.extract(from: input)
    let generator = Generator(identifiers: identifiers)
    try generator.generate(path: output)
}

enum CommandError: LocalizedError {
    case invalidArguments

    var errorDescription: String? {
        return "usage: DropBearGen input_folder output_file"
    }
}

do {
    guard
        let input = CommandLine.arguments[safe: 1],
        let output = CommandLine.arguments[safe: 2]
        else { throw CommandError.invalidArguments }

    try execute(input: Path(input), output: Path(output))

} catch let error {
    let string = """
    ERROR: \(error.localizedDescription)
    Arguments Provided: \(Array(CommandLine.arguments.dropFirst()))
    """

    fputs(string + "\n", stderr)
    exit(-1)
}
