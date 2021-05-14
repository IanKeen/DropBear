flags=-Xlinker -weak-l_InternalSwiftSyntaxParser -Xswiftc -suppress-warnings

build:
	@echo 'Building Debug'
	@swift build -c debug --product DropBearGen $(flags)

build-release:
	@echo 'Building Release'
	@swift build -c release --product DropBearGen --disable-sandbox $(flags)

clean:
	@echo 'Removing Artifacts'
	@rm -rf .build

rebuild: clean build

rebuild-release: clean build-release

package-release: rebuild-release
	@tar -czf DropBearGen.tar.gz --directory=.build/x86_64-apple-macosx/release DropBearGen
