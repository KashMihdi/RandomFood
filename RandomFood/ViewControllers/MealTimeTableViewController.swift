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
        title = "Справочник рецептов"
        
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        receipts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTime", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let receipt = receipts[indexPath.row]
        content.text = receipt.nameOfReceipt
        cell.contentConfiguration = content
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
}
