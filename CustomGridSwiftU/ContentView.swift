//
//  ContentView.swift
//  CustomGridSwiftU
//
//  Created by Игорь Сысоев on 25.01.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var persons = Persons()
    private let gridItem = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width))]
    private let gridRow = [GridItem(.fixed(50))]
    private let size = UIScreen.main.bounds.width * 0.9

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        LazyHGrid(rows: gridItem) {
                            ForEach(persons.persons, id: \.id) { person in
                                StoryItem(person: person, size: 50)
                            }
                        }
                    }
                }
                .frame(height: size * 0.2)
                ScrollView {
                    VStack {
                        LazyVGrid(columns: gridItem) {
                            ForEach(persons.persons, id: \.id) { person in
                                PersonItem(person: person, size: size)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Kilogramm")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

