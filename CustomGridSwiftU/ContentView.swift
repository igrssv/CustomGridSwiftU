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
    private let size = UIScreen.main.bounds.width * 0.9

    var body: some View {
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

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

