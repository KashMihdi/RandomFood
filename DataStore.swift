//
//  DataStore.swift
//  RandomFood
//
//  Created by Kasharin Mikhail on 26.04.2023.
//

import Foundation
final class DataStore {
    
    static let shared = DataStore()
    
    private init() {}
    
    func getReceipts() -> [MealTime:[Receipt]] {
        let receipts: [Receipt] = [
            Receipt(
                nameOfReceipt: "Яичные конвертики с сыром и ветчиной",
                description: "Сытное и вкусное блюдо с изюминкой, которое можно приготовить всего из 3 ингредиентов, - аппетитные, нежные и румяные яичные конвертики с ветчиной и сыром. Отличная альтернатива привычной яичнице для завтрака или перекус на скорую руку. Попробуйте!",
                ingredient: [
                    "Яйца": "4 шт.",
                    "Ветчина": "130 г",
                    "Сыр твердый": "100 г",
                    "Масло растительное": "1-2 ч. ложки",
                    "Петрушка свежая": "1 веточка"
                ],
                calories: 200,
                mealTime: MealTime.breakfast),
            Receipt(
                nameOfReceipt: "Тестовый рецепт 2",
                description: "Вкусное описание 2",
                ingredient: [
                    "Яйца": "4 шт.",
                    "Ветчина": "130 г",
                    "Петрушка свежая": "1 веточка"
                ],
                calories: 2000,
                mealTime: MealTime.breakfast),
            Receipt(
                nameOfReceipt: "Тестовый рецепт 3",
                description: "Вкусное описание 3",
                ingredient: [
                    "Яйца": "4 шт.",
                    "Ветчина": "130 г",
                ],
                calories: 199,
                mealTime: MealTime.lunch),
            Receipt(
                nameOfReceipt: "Тестовый рецепт 4",
                description: "Вкусное описание 4",
                ingredient: [
                    "Яйца": "4 шт.",
                    "Ветчина": "130 г",
                    "Петрушка свежая": "1 веточка"
                ],
                calories: 2050,
                mealTime: MealTime.breakfast)
        ]
        let dictionaryOfReceipts = Dictionary(grouping: receipts, by: { $0.mealTime })
        return dictionaryOfReceipts
        
    }
}
