//
//  TestView.swift
//  ObservationBPSwiftUIDemo
//
//  Created by Raf Cabezas on 1/5/24.
//

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

#Preview {
    TestView()
}
