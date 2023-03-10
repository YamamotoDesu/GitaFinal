# GitaFinal

[Build iOS App from scratch - Part 1 - Create Swift Package](https://www.youtube.com/watch?v=f73JNuh_A88)

[Build iOS App from scratch - Part 2 - Clean Code with SwiftLint](https://www.youtube.com/watch?v=wxLkqsj4QFY&t=2s)

[Build iOS App from scratch - Part 3 - Reusable Logger in Swift](https://www.youtube.com/watch?v=UwGPAzF6bOc)

```swift
import SwiftyBeaver

protocol BGLoggerType {
    func verbose(_ message: String, _ file: String, _ function: String, _ line: Int)
    func debug(_ message: String, _ file: String, _ function: String, _ line: Int)
    func info(_ message: String, _ file: String, _ function: String, _ line: Int)
    func warning(_ message: String, _ file: String, _ function: String, _ line: Int)
    func error(_ message: String, _ file: String, _ function: String, _ line: Int)
}

extension BGLoggerType {
    func verbose(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        verbose(message, file, function, line)
    }

    func debug(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        debug(message, file, function, line)
    }

    func info(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        info(message, file, function, line)
    }

    func warning(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        warning(message, file, function, line)
    }

    func error(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        error(message, file, function, line)
    }
}

class BGLogger: BGLoggerType {
 
//    static let shared = BGLogger()
//    private init() {}

    private let log: SwiftyBeaver.Type = {
        let log = SwiftyBeaver.self
        // add log destinations. at least one is needed!
        let console = ConsoleDestination()  // log to Xcode Console
        log.addDestination(console)

        return log
    }()

    func verbose(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.verbose(message, file, function, line: line)
    }

    func debug(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.debug(message, file, function, line: line)
    }

    func info(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.info(message, file, function, line: line)
    }

    func warning(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.warning(message, file, function, line: line)
    }

    func error(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.error(message, file, function, line: line)
    }
}
```

[Build iOS App from scratch - Part 4 - Dependency container || Swinject || Singleton](https://www.youtube.com/watch?v=c_tRpdt9GGM)

```swift
import Foundation
import Swinject

final class Injection {
    static let shared = Injection()
    var container: Container {
        get {
            if _container == nil {
                _container = buildContainer()
            }
            return _container!
        }

        set {
            _container = newValue
        }
    }

    private var _container: Container?

    private func buildContainer() -> Container {
        let container = Container()
        container.register(BGLoggerType.self) { _ in
            return BGLogger()
        }
        return container
    }
}

@propertyWrapper struct Injected<Dependency> {
    let wrappedValue: Dependency

    init() {
        self.wrappedValue = Injection.shared.container.resolve(Dependency.self)!
    }
}
```

```swift
import Foundation

class ContentViewModel: ObservableObject {

    @Injected private var logger: BGLoggerType

//    init(logger: BGLoggerType = BGLogger()) {
//        self.logger = logger
//    }

    func onAppear() {
        logger.info("View is loaded")
    }
}
```

[Build iOS App from scratch - Part 5 - Localization in SwiftUI](https://www.youtube.com/watch?v=eCBRBsdWfN8)

[Build iOS App from scratch - Part 6- Localization - Best approach using SwiftGen](https://www.youtube.com/watch?v=7sxHn0mF_fI)

```
if which swiftgen >/dev/null; then
  swiftgen
else
  echo "warning: SwiftGen not installed, download it from https://github.com/SwiftGen/SwiftGen"
fi
```

[Build iOS App from scratch - Part 7- SwiftFormat - Clean Code in Swift](https://www.youtube.com/watch?v=7k3IngPPP2A)
https://github.com/nicklockwood/SwiftFormat/blob/master/Rules.md
```
if which swiftformat >/dev/null; then
  swiftformat .
else
  echo "warning: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat"
fi
```

[Build iOS App from scratch - Part 8- Setup DEV, QA and PROD environment using schemes in Xcode](https://www.youtube.com/watch?v=P4IAh07LGiQ)

<img width="787" alt="スクリーンショット 2023-03-10 17 27 07" src="https://user-images.githubusercontent.com/47273077/224263577-3ded8319-6871-4703-8883-1277f8df9c3e.png">

<img width="633" alt="スクリーンショット_2023_03_10_17_29" src="https://user-images.githubusercontent.com/47273077/224264339-b2763d91-0c92-4179-8f05-0b5f8b5d2b16.png">

<img width="823" alt="スクリーンショット_2023_03_10_17_31" src="https://user-images.githubusercontent.com/47273077/224264540-2185d530-a35a-4d26-b41c-1e73a16c6b83.png">

<img width="899" alt="スクリーンショット 2023-03-10 17 25 15" src="https://user-images.githubusercontent.com/47273077/224263146-2c38e397-2bc4-42d6-bd64-baa91b7157ed.png">

<img width="802" alt="スクリーンショット 2023-03-10 17 21 25" src="https://user-images.githubusercontent.com/47273077/224262187-a1eddeb9-4749-4e4f-a73d-d88879189378.png">

<img width="713" alt="スクリーンショット 2023-03-10 17 19 11" src="https://user-images.githubusercontent.com/47273077/224261661-a778524c-5226-4701-a07d-d259679d251e.png">

<img width="1157" alt="スクリーンショット_2023_03_10_17_51" src="https://user-images.githubusercontent.com/47273077/224269729-ad95ff24-2ade-4652-8c1f-ecd3f635b681.png">

