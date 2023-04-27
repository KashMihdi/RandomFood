//
//  Team.swift
//  RandomFood
//
//  Created by Алексей Филиппов on 26.04.2023.
//

import Foundation
struct Person {
    let name: String
    let surname: String
    let age: Int
    let jobTitle: String
    let bio: String
    
    var fullName: String {
        "\(surname) \(name)"
    }
    
    static func getPerson() -> [Person] {
        [
            Person(
                name: "Алексей",
                surname: "Филиппов",
                age: 30,
                jobTitle: "UX/UI designer",
                bio: "some biography"
            ),
            Person(
                name: "Владимир",
                surname: "Фамильянов",
                age: 31,
                jobTitle: "iOS developer",
                bio: "some biography1"
            ),
            Person(
                name: "Михаил",
                surname: "Фамильев",
                age: 32,
                jobTitle: "iOS developer",
                bio: "some biography2"
            )
        ]
    }
    
}
