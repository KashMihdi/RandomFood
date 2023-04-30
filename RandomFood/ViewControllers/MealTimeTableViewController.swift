//
//  MealTimeTableViewController.swift
//  RandomFood
//
//  Created by Vovo on 28.04.2023.
//

import UIKit

class MealTimeTableViewController: UITableViewController {
    
    var receipts: [Receipt]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorColor = #colorLiteral(red: 0.5080919266, green: 0.8357288837, blue: 0.5953789353, alpha: 1)
        title = ""
        tableView.rowHeight = 50
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Справочник рецептов"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        receipts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTime", for: indexPath)
        let receipt = receipts[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.imageToTextPadding = 10
        content.image = UIImage(named: receipt.nameOfReceipt)
        content.imageProperties.cornerRadius = 10
        content.imageProperties.maximumSize = CGSize(width: tableView.rowHeight, height: tableView.rowHeight)
        content.text = receipt.nameOfReceipt
        content.textProperties.font = UIFont(name: "Gilroy-Medium", size: 19)!
        cell.contentConfiguration = content
        
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = #colorLiteral(red: 0.8664115071, green: 0.931476891, blue: 0.9045276046, alpha: 1)
        cell.selectedBackgroundView = selectedBackgroundView
        
        return cell
    }
 
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultTableViewController else { return }
        resultVC.receipts = sender as? Receipt
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let receipt = receipts[indexPath.row]
        performSegue(withIdentifier: "receipt", sender: receipt)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        var config = headerView.defaultContentConfiguration()
    
        config.text = self.tableView(tableView, titleForHeaderInSection: section)
        config.textProperties.font = UIFont.myFontGilroyBold(30)
        config.textProperties.color = UIColor.label
        // установка переноса текста на новую строку
        config.textProperties.numberOfLines = 0
        config.textProperties.lineBreakMode = .byWordWrapping
        headerView.contentConfiguration = config
        
        return headerView
    }
}
/*
// MARK: - UITableViewDelegate
extension MealTimeTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       80
    }
}
*/
