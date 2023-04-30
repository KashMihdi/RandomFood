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
    let town: String
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
                town: "Якутск",
                jobTitle: "iOS Developer",
                bio: "UX/UI дизайнер в региональном банке. В какой-то момент захотелось самому научится верстать на мобилке, поэтому я решил пойти на курсы Swiftbook"
            ),
            PersonStore(
                name: "Владимир",
                surname: "Ткаченко",
                age: "32",
                town: "Москва",
                jobTitle: "iOS Developer",
                bio: "Инженер медицинского оборудования по образованию, но в душе програмист. Пошел учиться в Swiftbook и в процессе обучения понял, что попалу куда нужно.  "
            ),
            PersonStore(
                name: "Михаил",
                surname: "Кашарин",
                age: "32",
                town: "Брянск",
                jobTitle: "iOS Developer",
                bio: "Владелец небольшого цеха по производству венилируемых фасадов. Когда пишу код - просто занимаюсь любимым делом. Всем добра!"
            )
        ]
    }
    
}
