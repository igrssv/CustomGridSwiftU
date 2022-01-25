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
    
    init(id: Int, userName: String, photo: String, like: Bool) {
        self.id = id
        self.userName = userName
        self.photo = photo
        self.like = like
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
        let peroson = Person(
            id: id,
            userName: userName,
            photo: photo,
            like: false)
        
        return peroson
    }

}
