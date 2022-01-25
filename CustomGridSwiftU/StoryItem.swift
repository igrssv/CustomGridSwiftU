//
//  StoryItem.swift
//  CustomGridSwiftU
//
//  Created by Игорь Сысоев on 25.01.2022.
//

import SwiftUI

struct StoryItem: View {
    @ObservedObject var person: Person
    var size: CGFloat
    
    var body: some View {
        ZStack {
            Image(systemName: person.avatar)
                .resizable()
                .frame(width: size * 0.9, height: size * 0.9)
                .shadow(color: .red, radius: 2)
        }
    }
}

struct StoryItem_Previews: PreviewProvider {
    static var previews: some View {
        StoryItem(person: Person.getPerson(id: 1), size: CGFloat(200))
    }
}
