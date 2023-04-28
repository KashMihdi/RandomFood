//
//  AboutPersonViewController.swift
//  RandomFood
//
//  Created by Алексей Филиппов on 27.04.2023.
//

import UIKit

class AboutPersonViewController: UIViewController {
    
    @IBOutlet var photoOfPerson: UIImageView!
    @IBOutlet var ageOfPerson: UILabel!
    @IBOutlet var jobTitleOfPerson: UILabel!
    @IBOutlet var bioOfPerson: UILabel!
    
    var person: PersonStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = person.fullName
        photoOfPerson.image = UIImage(named: person.fullName)
        photoOfPerson.layer.cornerRadius = 16
        ageOfPerson.text = "Возраст: \(person.age)"
        jobTitleOfPerson.text = "Должность: \(person.jobTitle)"
        bioOfPerson.text = person.bio
    }
}
