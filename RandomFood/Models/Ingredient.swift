//
//  Ingredient.swift
//  RandomFood
//
//  Created by Kasharin Mikhail on 28.04.2023.
//

import Foundation

struct Ingredient {
    let name: String
    let category: FoodCategory
    
    
    private init(name: String, category: FoodCategory) {
        self.name = name
        self.category = category
    }
    
    static func getIngredients() -> [String : [Ingredient]] {
        let ingredients = [
            Ingredient(name: "Яйца", category: .dairy),
            Ingredient(name: "Курица", category: .meat),
            Ingredient(name: "Форель", category: .fish),
            Ingredient(name: "Рис", category: .cereals),
            Ingredient(name: "Петрушка свежая", category: .vegetables),
            Ingredient(name: "Яблоко", category: .fruit),
            Ingredient(name: "Говядина", category: .meat),
            Ingredient(name: "Ветчина", category: .meat)
        ]
        let dictionaryOfIngredients = Dictionary(grouping: ingredients, by: { $0.category.rawValue })
        return dictionaryOfIngredients
    }
    
    enum FoodCategory: String {
        case meat = "Мясо"
        case fish = "Рыба"
        case dairy = "Молочные продукты"
        case cereals = "Крупы"
        case vegetables = "Овощи"
        case fruit = "Фрукты"
    }
}
