//
//  AboutPersonViewController.swift
//  RandomFood
//
//  Created by Алексей Филиппов on 27.04.2023.
//

import UIKit

final class AboutPersonViewController: UIViewController {
    
    @IBOutlet var photoOfPerson: UIImageView!
    @IBOutlet var ageOfPerson: UILabel!
    @IBOutlet var jobTitleOfPerson: UILabel!
    @IBOutlet var bioOfPerson: UILabel!
    @IBOutlet var townLabel: UILabel!
    
    var person: PersonStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = person.fullName
        photoOfPerson.image = UIImage(named: person.fullName)
        photoOfPerson.layer.cornerRadius = 16
        ageOfPerson.text = "Возраст: \(person.age)"
        townLabel.text = "Город: \(person.town)"
        jobTitleOfPerson.text = "Должность: \(person.jobTitle)"
        bioOfPerson.text = person.bio
    /*
        //Изменение размера шрифта заголовка.
        let textLabel = UILabel()
        textLabel.text = "О проекте"
        textLabel.font = UIFont(name: "Gilroy-Bold", size: 23)
        textLabel.textAlignment = .center
        navigationItem.titleView = textLabel*/
    }
}
