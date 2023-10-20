//
//  ContentViewD.swift
//  ObservationBPSwiftUIDemo
//
//  Created by winddpan on 2023/10/19.
//

import SwiftUI

@available(iOS 17.0, *)
struct ContentViewD: View {
    private var person = Person17(name: "Tom", age: 12)
    @StateObject private var ref = Ref()
    @State private var randomColor = Color(
        red: .random(in: 0 ... 1),
        green: .random(in: 0 ... 1),
        blue: .random(in: 0 ... 1)
    )

    var body: some View {
        Self._printChanges()
        return VStack {
            Text(person.name)
            Text("\(person.age)")

            VStack {
                PersonNameView(person: person)
                PersonAgeView(person: person)
            }
            .padding()

            HStack {
                Button("+") { person.age += 1 }
                Button("-") { person.age -= 1 }
                Button("name") { person.name += "@" }
            }
        }
        .padding()
        .background(randomColor)
        .foregroundColor(ref.randomColor)
    }
}

@available(iOS 17.0, *)
private struct PersonNameView: View {
    @State private var person: Person17
    private var clz = Clz17(name: UUID().uuidString.components(separatedBy: "-")[0])

    fileprivate init(person: Person17) {
        self.person = person
    }

    var body: some View {
        let _ = Self._printChanges()
        VStack {
            Text(person.name)
            Text(clz.name)
        }
    }
}

@available(iOS 17.0, *)
private struct PersonAgeView: View {
    @State private var person: Person17
    fileprivate init(person: Person17) {
        self.person = person
    }

    var body: some View {
        Self._printChanges()
        if Bool.random() {
            return Text("\(person.age)")
                .background(Color.red)
        } else {
            return Text("\(person.age) 999")
                .background(Color.blue)
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    ContentViewD()
}