//
//  SecondViewController.swift
//  RandomFood
//
//  Created by Алексей Филиппов on 27.04.2023.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var teamList = PersonStore.getPerson()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 60
        self.navigationItem.backButtonTitle = ""
        tableView.separatorStyle = .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        let person = teamList[indexPath.row]
        let detailsVC = segue.destination as? AboutPersonViewController
        detailsVC?.person = person
    }
}

//MARK: - TableViewDataSource
extension InformationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = teamList[indexPath.row]
        content.text = person.fullName
        content.textProperties.color = .init(
            red: 0.221,
            green: 0.209,
            blue: 0.202,
            alpha: 1
        )
        content.textProperties.font = UIFont(name: "Gilroy-Medium", size: 16)!
        content.secondaryText = person.jobTitle
        content.secondaryTextProperties.color = .init(
            red: 0.67,
            green: 0.67,
            blue: 0.67,
            alpha: 1
        )
        content.secondaryTextProperties.font = UIFont(name: "Gilroy-Medium", size: 14)!
        content.image = UIImage(named: person.fullName)
        content.imageToTextPadding = 16
        content.imageProperties.maximumSize.height = 48
        content.imageProperties.cornerRadius = 12
        cell.contentConfiguration = content
        return cell
    }
    
}
