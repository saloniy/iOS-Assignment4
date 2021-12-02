//
//  Recipe.swift
//  yummy-recipes
//
//  Created by user202495 on 11/21/21.
//

import Foundation

struct recipeResult: Codable {
    var meals: [RecipeData];
}

struct RecipeData: Codable {
    var idMeal: String; // recipe id
    var strMeal: String; // recipe name
    var strMealThumb: String; // recipe thumbnail
}
