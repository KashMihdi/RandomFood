//
//  TabBarController.swift
//  RandomFood
//
//  Created by Kasharin Mikhail on 26.04.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBarItem.image = #imageLiteral(resourceName: "RandomFoodLogo")
        tabBar.tintColor = .tabBarItemAccent
        getViewController()
    }
    
    private func getViewController() {
        guard let viewControllers else { return }
        for viewController in viewControllers {
            if let mainVC = viewController as? MainViewController {
                mainVC.title = "Главная"
                mainVC.tabBarItem.image = UIImage(systemName: "house.fill")
            }
        }
    }
    
    private func setTabBar() {
        let positionOnX: CGFloat = 20
        let positionOnY: CGFloat = 6
        let wight = tabBar.bounds.width - positionOnX * 2
        let heigh = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(
            x: positionOnX,
            y: tabBar.bounds.minY - positionOnY,
            width: wight,
            height: heigh
            ),
        cornerRadius: heigh / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = wight / 5
        tabBar.itemPositioning = .fill
        
        roundLayer.fillColor = UIColor.mainTabBar.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
        
    }
}
