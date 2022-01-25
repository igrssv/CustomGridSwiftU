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
    @State private var comment = ""

    var body: some View {
        
            VStack {
                HStack {
                    Image(systemName: person.avatar)
                    Text(person.userName)
                    Spacer()
                }
                Image(systemName: person.photo)
                    .resizable()
                    .frame(width: size * 0.7, height: size * 0.7)
                Spacer(minLength: 20)
                HStack {
                    Button(action: isLike) {
                        Image(systemName: person.like ? "heart.fill" : "heart")
                            .foregroundColor(person.like ? .red : .secondary)
                        Button(action: {}) {
                            Image(systemName: "bubble.right")
                                .foregroundColor(.secondary)
                        }
                        Image(systemName: "paperplane")
                            .foregroundColor(.secondary)
                        Spacer()
                        Image(systemName: "bookmark")
                            .foregroundColor(.secondary)
                    }
                }
                TextField("Введите комментарий", text: $comment)
            }
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
