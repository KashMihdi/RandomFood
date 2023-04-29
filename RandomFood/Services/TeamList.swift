//
//  Team.swift
//  RandomFood
//
//  Created by Алексей Филиппов on 26.04.2023.
//

import Foundation
struct PersonStore {
    
    let name: String
    let surname: String
    let age: String
    let jobTitle: String
    let bio: String
    
    var fullName: String {
        "\(surname) \(name)"
    }
    
    static func getPerson() -> [PersonStore] {
        [
            PersonStore(
                name: "Алексей",
                surname: "Филиппов",
                age: "30",
                jobTitle: "iOS Developer",
                bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            ),
            PersonStore(
                name: "Владимир",
                surname: "Ткаченко",
                age: "32",
                jobTitle: "iOS Developer",
                bio: "Инженер медицинского оборудования по образованию, но в душе програмист. Пошел учиться в Swiftbook и в процессе обучения понял, что попалу куда нужно.  "
            ),
            PersonStore(
                name: "Михаил",
                surname: "Кашарин",
                age: "32",
                jobTitle: "iOS Developer",
                bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            )
        ]
    }
    
}
