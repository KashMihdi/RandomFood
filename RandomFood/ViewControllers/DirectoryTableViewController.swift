//
//  DirectoryTableViewController.swift
//  RandomFood
//
//  Created by Vovo on 28.04.2023.
//

import UIKit

class DirectoryTableViewController: UITableViewController {
    var receipts = DataStore.shared.getReceipts()
    
    let categories: [MealTime] = [.breakfast, .lunch, .dinner]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Изменение размера шрифта заголовка.
        let textLabel = UILabel()
        textLabel.text = "Выберите время приема пищи"
        textLabel.font = UIFont(name: "Gilroy-Bold", size: 23)
        textLabel.textAlignment = .center
        navigationItem.titleView = textLabel
        
        tableView.separatorColor = #colorLiteral(red: 0.5080919266, green: 0.8357288837, blue: 0.5953789353, alpha: 1)
        tableView.rowHeight = 70
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Directory", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = categories[indexPath.row].rawValue
        content.textProperties.font = UIFont(name: "Gilroy-Medium", size: 22)!
        content.textProperties.alignment = .natural
        content.imageToTextPadding = 16
        content.imageProperties.tintColor = #colorLiteral(red: 0.5080919266, green: 0.8357288837, blue: 0.5953789353, alpha: 1)
        switch indexPath.row {
        case 0:
            content.image = UIImage(systemName: "sunrise.fill")
        case 1:
            content.image = UIImage(systemName: "sun.max.fill")
        default:
            content.image = UIImage(systemName: "sunset.fill")
        }
        cell.contentConfiguration = content
        
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = #colorLiteral(red: 0.8664115071, green: 0.931476891, blue: 0.9045276046, alpha: 1)
        cell.selectedBackgroundView = selectedBackgroundView
        
        return cell
    }
   /* override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Выберите время приема пищи:"
    }*/
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }

        let mealTimeVC = segue.destination as? MealTimeTableViewController
        mealTimeVC?.receipts = receipts[categories[indexPath.row]]
   
    }
}

extension DirectoryTableViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        var config = headerView.defaultContentConfiguration()
        
        config.text = self.tableView(tableView, titleForHeaderInSection: section)
        config.textProperties.font = UIFont.myFontGilroyBold(25)
        config.textProperties.color = UIColor.label
        // установка переноса текста на новую строку
        config.textProperties.numberOfLines = 0
        config.textProperties.lineBreakMode = .byWordWrapping
        headerView.contentConfiguration = config
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
