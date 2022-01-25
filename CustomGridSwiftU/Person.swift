//
//  Person.swift
//  CustomGridSwiftU
//
//  Created by Игорь Сысоев on 25.01.2022.
//


import Combine


class Persons: ObservableObject {
    @Published var  persons = Person.getPersons()
}

class Person: ObservableObject {
    let id: Int
    let userName: String
    let photo: String
    @Published var like: Bool
    let avatar: String
    @Published var viewed: Bool
    
    init(id: Int, userName: String, photo: String, like: Bool, avatar: String, viewed: Bool) {
        self.id = id
        self.userName = userName
        self.photo = photo
        self.like = like
        self.avatar = avatar
        self.viewed = viewed
    }
    
    static func getPersons() -> [Person] {
        var perosns = [Person]()
        
        for id in 0..<DataManager.shared.userName.count {
            perosns.append(getPerson(id: id))
        }
        return perosns
    }
    
    static func getPerson(id: Int) -> Person {
        let userName = DataManager.shared.userName[id]
        let photo = DataManager.shared.photo[id]
        let avatar = DataManager.shared.avatar[id]
        let peroson = Person(
            id: id,
            userName: userName,
            photo: photo,
            like: false,
            avatar: avatar,
            viewed: false
        )
        
        return peroson
    }

}
