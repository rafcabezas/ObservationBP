# Observation Back-Porting

SPM for back-porting the Observation framework to earlier OS versions.

The same APIs as the Observation framework are provided but without the limitation of iOS/tvOS 17. 

Verified on Xcode 15.1.

### Usage

```swift
import SwiftUI
import ObservationBP

struct TestView: View {
    @State var viewModel = TestViewModel()

    var body: some View {
        ObservationView {
            VStack {
                Text("Counter = \(viewModel.counter)")
                Button("Increment Count") {
                    viewModel.increment()
                }
            }
        }
    }
}

@Observable final class TestViewModel {
    var counter = 0

    func increment() {
        counter += 1
    }
}
```

## Based on
 [onevcat/ObservationBP](https://github.com/onevcat/ObservationBP)

### Switching to the Stock Observation Framework

When you can set iOS/tvOS 17 or later as your deploy target, you can switch back to the official framework.

1. Instead of importing `ObservationBP`, change to `import Observation`.
2. Add `typealias ObservationView = Group` to allow the project building. Then remove all `ObservationView` eventually.
