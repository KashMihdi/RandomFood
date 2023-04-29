//
//  TabBarController.swift
//  RandomFood
//
//  Created by Kasharin Mikhail on 26.04.2023.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = #colorLiteral(red: 0.5080919266, green: 0.8357288837, blue: 0.5953789353, alpha: 1)
        getViewController()
    }
    
    // MARK: - Set UI for ViewControllers
    private func getViewController() {
        guard let viewControllers else { return }
        viewControllers.forEach{
            let navigationVC  = $0 as? UINavigationController
            if let mainVC = navigationVC?.topViewController as? MainViewController {
                mainVC.title = "RandomFood"
                mainVC.tabBarItem.title = "Главная"
                mainVC.tabBarItem.image = UIImage(systemName: "house.fill")
            } else if let ingredientVC = navigationVC?.topViewController as? IngredientsViewController {
                ingredientVC.title = "Выбери продукты"
                ingredientVC.tabBarItem.title = "Продукты"
                ingredientVC.tabBarItem.image = UIImage(systemName: "checklist")
            } else if let directoryVC = navigationVC?.topViewController as? DirectoryTableViewController {
                directoryVC.title = ""
                directoryVC.tabBarItem.title = "Рецепты"
                directoryVC.tabBarItem.image = UIImage(systemName: "fork.knife")
            }
        }
    }
    
}
