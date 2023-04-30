//
//  IngredientsViewController.swift
//  RandomFood
//
//  Created by Kasharin Mikhail on 28.04.2023.
//

import UIKit

class IngredientsViewController: UITableViewController {

    // MARK: - Private properties
    private var ingredients = Ingredient.getIngredients()
    
    // MARK: - Public properties
    var selectedIngredients: [String] = []
    
    // MARK: - ViewLifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelection = true
        tableView.separatorColor = #colorLiteral(red: 0.5080919266, green: 0.8357288837, blue: 0.5953789353, alpha: 1)
        
        let item: UIBarButtonItem
        item = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(doneButtonTapped)
        )
        navigationItem.rightBarButtonItem = item
        navigationItem.rightBarButtonItem?.isEnabled = false
        //Изменение размера шрифта заголовка.
        let textLabel = UILabel()
        textLabel.text = "Выберите продукты"
        textLabel.font = UIFont(name: "Gilroy-Bold", size: 23)
        textLabel.textAlignment = .center
        navigationItem.titleView = textLabel
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        tableView.reloadData()
        selectedIngredients = []
        navigationItem.rightBarButtonItem?.isEnabled = false
    }

    // MARK: - TableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return ingredients.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = Array(ingredients.keys)[section]
        return ingredients[sectionKey]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let sectionKey = Array(ingredients.keys)[indexPath.section]
        let sectionValues = ingredients[sectionKey]!
        
        var content = cell.defaultContentConfiguration()
        content.text = sectionValues[indexPath.row].name
        content.textProperties.font = UIFont(name: "Gilroy-Medium", size: 19)!
        content.image = UIImage(systemName: "circle")
        content.imageProperties.tintColor = #colorLiteral(red: 0.5080919266, green: 0.8357288837, blue: 0.5953789353, alpha: 1)
        cell.contentConfiguration = content
        
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = #colorLiteral(red: 0.8664115071, green: 0.931476891, blue: 0.9045276046, alpha: 1)
        cell.selectedBackgroundView = selectedBackgroundView

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(ingredients.keys)[section]
    }
    
    // MARK: - Transfer Data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mealTimeVC = segue.destination as? MealTimeTableViewController else { return }
        mealTimeVC.receipts = sender as? [Receipt]
    }
    
    // MARK: - IBActions
    @objc func doneButtonTapped(_ sender: UIBarButtonItem) {
        let receipts = Receipt.getResult(with: selectedIngredients)
        performSegue(withIdentifier: "detail", sender: receipts)
    }
}
// MARK: - TableViewDelegate
extension IngredientsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationItem.rightBarButtonItem?.isEnabled = true
        
        let sectionKey = Array(ingredients.keys)[indexPath.section]
        let sectionValues = ingredients[sectionKey]
        let selectedItem = sectionValues?[indexPath.row].name ?? ""
        selectedIngredients.append(selectedItem)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            var content = cell.defaultContentConfiguration()
            content.text = sectionValues?[indexPath.row].name
            content.textProperties.font = UIFont(name: "Gilroy-Medium", size: 21)!
            content.image = UIImage(systemName: "checkmark.circle")
            content.imageProperties.tintColor = #colorLiteral(red: 0.5080919266, green: 0.8357288837, blue: 0.5953789353, alpha: 1)
            cell.contentConfiguration = content
        }
        

    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let sectionKey = Array(ingredients.keys)[indexPath.section]
        let sectionValues = ingredients[sectionKey]
        let deselectedItem = sectionValues?[indexPath.row].name ?? ""
        if let index = selectedIngredients.firstIndex(of: deselectedItem) {
            selectedIngredients.remove(at: index)
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            var content = cell.defaultContentConfiguration()
            content.text = sectionValues?[indexPath.row].name
            content.textProperties.font = UIFont(name: "Gilroy-Medium", size: 19)!
            content.image = UIImage(systemName: "circle")
            content.imageProperties.tintColor = #colorLiteral(red: 0.5080919266, green: 0.8357288837, blue: 0.5953789353, alpha: 1)
            cell.contentConfiguration = content
        }
        if selectedIngredients.count == 0 {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let contentView = UIView()
        contentView.backgroundColor = #colorLiteral(red: 0.5080919266, green: 0.8357288837, blue: 0.5953789353, alpha: 1)
        
        let categoryNameLabel = UILabel(
            frame: CGRect(
                x: 8,
                y: 10,
                width: tableView.frame.width,
                height: 20
            )
        )
        categoryNameLabel.text = Array(ingredients.keys)[section]
        categoryNameLabel.font = UIFont(name: "Gilroy-Bold", size: 20)
        categoryNameLabel.textColor = .white
        contentView.addSubview(categoryNameLabel)
        return contentView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }

}
