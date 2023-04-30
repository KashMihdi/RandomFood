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
    
    var ingredientsForReceipt: Set<String> {
        Set(ingredients.keys)
    }
    
    static func getReceipt(with mealTime: MealTime, calories: Int?) -> Receipt? {
        if let calories {
            return DataStore.shared.getReceipts()[mealTime]?
                .filter{ ($0.calories - 50...$0.calories + 50).contains(calories)}
                .randomElement()
        } else {
            return DataStore.shared.getReceipts()[mealTime]?
                .randomElement()
        }
    }
    
    static func getResult(with ingredients: [String]) -> [Receipt] {
        var matchedReceipts: [Receipt] = []
        let setFromList = Set(ingredients)
        let receipts = Array(DataStore.shared.getReceipts().values.flatMap{$0}.shuffled())
        for receipt in receipts {
            if !setFromList.isDisjoint(with: receipt.ingredientsForReceipt) {
                matchedReceipts.append(receipt)
                if matchedReceipts.count >= 5 {
                    return matchedReceipts
                }
            }
        }
        return matchedReceipts
    }
}

enum MealTime: String {
    case breakfast = "завтрак"
    case lunch = "обед"
    case dinner = "ужин"
}


