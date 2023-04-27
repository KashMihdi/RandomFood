//
//  Receipt.swift
//  RandomFood
//
//  Created by Kasharin Mikhail on 26.04.2023.
//

import Foundation

struct Receipt {
    let nameOfReceipt: String
    let description: String
    let ingredients: [String: String]
    let calories: Int
    let mealTime: MealTime
    
    
    static func getReceipt(with mealTime: MealTime, calories: Int?) -> Receipt? {
        if let calories {
            return DataStore.shared.getReceipts()[mealTime]?
                .filter{ ($0.calories - 100...$0.calories + 100).contains(calories)}
                .randomElement()
        } else {
            return DataStore.shared.getReceipts()[mealTime]?
                .randomElement()
        }
    }
}

enum MealTime: String {
    case breakfast = "завтрак"
    case lunch = "обед"
    case dinner = "ужин"
}

enum Ingredient: String {
    case egg = "Яйца"
    case ham = "Ветчина"
    case cheeseHard = "Твердый сыр"
    case beanGreen = "Фасоль стручковая"
    case tomato = "Помидоры"
    case curd = "Творог"
    case kruppaSemolina = "Круппа манная"
    case butter = "Масло сливочное 72%"
    case longLoaf = "Батон"
    case appleJam = "Варенье из яблок"
    case kruppaBuckwheat = "Круппа гречневая"
    case milk = "Молоко 2,5%"
    case candiedFruit = "Цукаты"
    case raisin = "Изюм"
    case crackerWheat = "Сухари пшеничные"
    case sourCream = "Сметана 10% жирности"
    case cereals = "Овсяные хлопья"
    case kefir = "Кефир"
    case honey = "Мёд"
    case carrot = "Морковь"
    case potato = "Картофель"
    case garlic = "Чеснок"
    case trout = "Форель морская"
    case beanCanned = "Фасоль красная, консервированная"
    case pepperBulgarian = "Перец болгарский красный"
    case cornCanned = "Кукуруза консервы"
    case chickenBreast = "Куриная грудка"
    case pork = "Свинина"
    case pinkSalmon = "Горбуша"
    case yogurt = "Йогурт"
    case pasta = "Макароны"
    case spaghetti = "Спагетти"
    case cod = "Треска"
}
