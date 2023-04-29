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
        print(receipts[0])
        
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
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let resultVC = segue.destination as? ResultDirectoryViewController
        resultVC?.receipts = receipts[indexPath.row]
        
    }
}
