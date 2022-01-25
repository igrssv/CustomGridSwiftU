//
//  PersonItem.swift
//  CustomGridSwiftU
//
//  Created by Игорь Сысоев on 25.01.2022.
//

import SwiftUI

struct PersonItem: View {
    @ObservedObject var person: Person
    var size: CGFloat

    var body: some View {
        
            VStack {
                Image(systemName: person.photo)
                    .resizable()
                    .frame(width: size, height: size)
                HStack {
                    Text(person.userName)
                    Spacer()
                    Button(action: isLike) {
                        Image(systemName: person.like ? "heart.fill" : "heart")
                    }
                }
            }
            .padding()
        
    }
    private func isLike() {
        person.like.toggle()
    }
}

struct PersonItem_Previews: PreviewProvider {
    static var previews: some View {
        PersonItem(person: Person.getPerson(id: 1), size: CGFloat(200))
    }
}
