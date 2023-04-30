//
//  SecondViewController.swift
//  RandomFood
//
//  Created by Алексей Филиппов on 27.04.2023.
//

import UIKit

final class InformationViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var tableView: UITableView!
    
    //MARK: - Privat Properties
    private var teamList = PersonStore.getPerson()

    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        
        self.navigationItem.backButtonTitle = ""
        
        
        //Изменение размера шрифта заголовка.
        let textLabel = UILabel()
        textLabel.text = "О проекте"
        textLabel.font = UIFont(name: "Gilroy-Bold", size: 23)
        textLabel.textAlignment = .center
        navigationItem.titleView = textLabel
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        let person = teamList[indexPath.row]
        let detailsVC = segue.destination as? AboutPersonViewController
        detailsVC?.person = person
    }
}

extension InformationViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teamList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonTableViewCell
        let person = teamList[indexPath.row]
        cell.fullNameLabel.text = person.fullName
        cell.jobTitleLabel.text = person.jobTitle
        cell.photo.image = UIImage(named: person.fullName)
        cell.photo.layer.cornerRadius = 12
        
        return cell
    }

}
