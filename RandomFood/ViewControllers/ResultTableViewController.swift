//
//  ResultTableViewController.swift
//  RandomFood
//
//  Created by Vovo on 27.04.2023.
//

import UIKit

class ResultTableViewController: UITableViewController {
    private var ingredientsList: [String] = []

    //var receipt: Receipt!
    var receipt = Receipt.getReceipt(with: .dinner, calories: 400)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Сегодня на \(receipt?.mealTime.rawValue ?? "")"
        
        let ingretients = receipt?.ingredients ?? [:]
        for (key, value) in ingretients {
            let ingredientString = "\(key):   \(value)"
            ingredientsList.append(ingredientString)
        }
        // Создание изображения перед таблицей.
        let imageView = UIImageView(image: UIImage(named: receipt?.nameOfReceipt ?? ""))
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.masksToBounds = true
        
        tableView.tableHeaderView = imageView
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titleForHeaderInSection = section == 0
            ? "\(receipt?.nameOfReceipt ?? ""), \(receipt?.calories ?? 0) ккал"
            : "Ингридиенты: "
        return titleForHeaderInSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = section == 0 ? 1 : receipt?.ingredients.keys.count ?? 0
        return numberOfRowsInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "description", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.textProperties.font = UIFont.myFontGilroyMedium(17)
        content.textProperties.alignment = .justified
        content.text =  indexPath.section == 0 ? receipt?.description : ingredientsList[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 1 ? 27 : tableView.rowHeight
    }
}
// MARK: - UITableViewDelegate
extension ResultTableViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        var config = headerView.defaultContentConfiguration()
    
        config.text = self.tableView(tableView, titleForHeaderInSection: section)
        config.textProperties.font = UIFont.myFontGilroyBold(20)
        config.textProperties.color = UIColor.label
        // установка переноса текста на новую строку
        config.textProperties.numberOfLines = 0
        config.textProperties.lineBreakMode = .byWordWrapping
        headerView.contentConfiguration = config
        
        return headerView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}// MARK: - UIFont
extension UIFont {
    static func myFontGilroyMedium(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Gilroy-Medium", size: size)!
    }
    static func myFontGilroyBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Gilroy-Bold", size: size)!
    }
}
