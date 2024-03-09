//
//  MainScreenModel.swift
//  RestFood
//
//  Created by Danil on 31.01.2024.
//

import Foundation

struct FoodCategory {
    let name: String
    let foods: [Food]
}

struct Food {
    let name: String
    let description: String
    let price: Double
}

struct CafeMenu {
    let categories: [FoodCategory]
}
struct foodModel {
    let foodCategories = [
        FoodCategory(name: "Appetizers", foods: [
            Food(name: "Bruschetta", description: "Toasted bread topped with tomatoes, garlic, and basil", price: 8.99),
            Food(name: "Calamari", description: "Fried squid rings served with marinara sauce", price: 10.99),
            Food(name: "Caprese Salad", description: "Fresh mozzarella, tomatoes, and basil drizzled with balsamic glaze", price: 9.99),
            Food(name: "Garlic Bread", description: "Toasted bread with garlic butter and herbs", price: 6.99),
            Food(name: "Stuffed Mushrooms", description: "Mushroom caps stuffed with seasoned breadcrumbs and cheese", price: 7.99)
        ]),
        FoodCategory(name: "Main Courses", foods: [
            Food(name: "Chicken Alfredo", description: "Creamy fettuccine pasta with grilled chicken", price: 15.99),
            Food(name: "Grilled Salmon", description: "Fresh salmon fillet grilled to perfection", price: 18.99),
            Food(name: "Margherita Pizza", description: "Classic pizza with tomato sauce, mozzarella, and basil", price: 12.99),
            Food(name: "Pasta Carbonara", description: "Spaghetti with bacon, eggs, and Parmesan cheese", price: 14.99),
            Food(name: "Steak Frites", description: "Grilled steak served with French fries", price: 20.99)
        ]),
        FoodCategory(name: "Salads", foods: [
            Food(name: "Caesar Salad", description: "Romaine lettuce, croutons, Parmesan cheese, and Caesar dressing", price: 9.99),
            Food(name: "Greek Salad", description: "Mixed greens, tomatoes, cucumbers, olives, feta cheese, and Greek dressing", price: 10.99),
            Food(name: "Cobb Salad", description: "Mixed greens, grilled chicken, avocado, bacon, eggs, and blue cheese dressing", price: 12.99)
        ]),
        FoodCategory(name: "Sandwiches", foods: [
            Food(name: "BLT Sandwich", description: "Bacon, lettuce, tomato, and mayo on toasted bread", price: 8.99),
            Food(name: "Turkey Club Sandwich", description: "Turkey, bacon, lettuce, tomato, and mayo on three slices of toast", price: 10.99),
            Food(name: "Caprese Panini", description: "Tomato, mozzarella, basil, and balsamic glaze on grilled ciabatta bread", price: 9.99)
        ]),
        FoodCategory(name: "Desserts", foods: [
            Food(name: "Chocolate Lava Cake", description: "Warm chocolate cake with a molten chocolate center", price: 7.99),
            Food(name: "New York Cheesecake", description: "Classic cheesecake topped with fresh berries", price: 6.99),
            Food(name: "Tiramisu", description: "Italian dessert made with coffee-soaked ladyfingers and mascarpone cheese", price: 8.99)
        ])
    ]
}


