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
            Ingredient(name: "Яйца", category: .meat),
            Ingredient(name: "Куриная грудка", category: .meat),
            Ingredient(name: "Форель", category: .fish),
            Ingredient(name: "Горбуша", category: .fish),
            Ingredient(name: "Треска", category: .fish),
            Ingredient(name: "Спагетти", category: .cereals),
            Ingredient(name: "Ветчина", category: .meat),
            Ingredient(name: "Свинина", category: .meat),
            Ingredient(name: "Варенье из яблок", category: .jam),
            Ingredient(name: "Твердый сыр", category: .dairy),
            Ingredient(name: "Петрушка", category: .vegetables),
            Ingredient(name: "Фасоль стручковая", category: .vegetables),
            Ingredient(name: "Помидоры", category: .vegetables),
            Ingredient(name: "Лук репчатый", category: .vegetables),
            Ingredient(name: "Творог", category: .dairy),
            Ingredient(name: "Крупа манная", category: .cereals),
            Ingredient(name: "Масло сливочное 72%", category: .dairy),
            Ingredient(name: "Крупа гречневая", category: .cereals),
            Ingredient(name: "Молоко 2,5%", category: .dairy),
            Ingredient(name: "Сметана 10% Жирности", category: .dairy),
            Ingredient(name: "Кефир", category: .dairy),
            Ingredient(name: "Мед", category: .honey),
            Ingredient(name: "Морковь", category: .vegetables),
            Ingredient(name: "Картофель", category: .vegetables),
            Ingredient(name: "Чеснок", category: .vegetables),
            Ingredient(name: "Сыр моцарелла", category: .dairy),
            Ingredient(name: "Сыр тильзитер", category: .dairy),
            Ingredient(name: "Сыр козий", category: .dairy),
            Ingredient(name: "Сыр горгонзола", category: .dairy),
            Ingredient(name: "Сыр чеддер", category: .dairy),
            Ingredient(name: "Сыр маасдам", category: .dairy),
            Ingredient(name: "Сыр плавленный", category: .dairy),
            Ingredient(name: "Сыр рикотта", category: .dairy),
            Ingredient(name: "Сыр пармезан", category: .dairy),
            Ingredient(name: "Фасоль красная", category: .cannedFood),
            Ingredient(name: "Кукуруза", category: .cannedFood),
            Ingredient(name: "Перец болгарский красный", category: .vegetables),
            Ingredient(name: "Йогурт", category: .dairy),
            Ingredient(name: "Горошек зеленый", category: .cannedFood),
            Ingredient(name: "Апельсин", category: .fruit),
            Ingredient(name: "Авокадо", category: .fruit)
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
        case jam = "Варенье"
        case cannedFood = "Консервы"
        case honey = "Сладости"
        
    }
}
