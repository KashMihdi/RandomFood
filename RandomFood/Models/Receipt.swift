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


