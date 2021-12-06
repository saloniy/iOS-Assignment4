//
//  RecipeServiceController.swift
//  yummy-recipes
//
//  Created by user202495 on 11/28/21.
//

import Foundation
import UIKit

class RecipeServiceController {
    
    static var shared = RecipeServiceController();
    let baseApi = "https://www.themealdb.com/api/json/v1/1";
    
    func getMealCategories(handler: @escaping (categoryResult)->Void) {
        let urlString = baseApi + "/categories.php";
        let urlWithEncoding = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let urlObj = URL(string: urlWithEncoding!)!;
        let task = URLSession.shared.dataTask(with: urlObj) { data, apiResponse, err in
            if let error = err {
                print(error);
            }
            guard let httpResponse = apiResponse as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Some Error Occurred....");
                return;
            }
            if let categoryData = data {
                let decoder = JSONDecoder();
                let result = try? decoder.decode(categoryResult.self, from: categoryData)
                handler(result!);
            }
        }
        task.resume();
    }
    
    func getMealRecipes(category: String, handler: @escaping(recipeResult)->Void) {
        let urlString = baseApi + "/filter.php?c=" + category;
        let urlWithEncoding = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let urlObj = URL(string: urlWithEncoding!)!;
        let task = URLSession.shared.dataTask(with: urlObj) { data, apiResponse, err in
            if let error = err {
                print(error);
            }
            guard let httpResponse = apiResponse as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Some Error Occurred....");
                return;
            }
            if let recipeData = data {
                let decoder = JSONDecoder();
                let result = try? decoder.decode(recipeResult.self, from: recipeData)
                handler(result!);
            }
        }
        task.resume();
    }
    
    func getMealRecipeDetails(recipe: String, handler: @escaping(recipeDetailResult)->Void) {
        let urlString = baseApi + "/search.php?s=" + recipe;
        let urlWithEncoding = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let urlObj = URL(string: urlWithEncoding!)!;
        let task = URLSession.shared.dataTask(with: urlObj) {data, apiResponse, err in
            if let error = err {
                print(error);
            }
            guard let httpResponse = apiResponse as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Some Error Occurred....");
                return;
            }
            if let recipeDetailData = data {
                let decoder = JSONDecoder();
                let result = try? decoder.decode(recipeDetailResult.self, from: recipeDetailData)
                handler(result!);
            }
        }
        task.resume();
    }
    
    func getImageThubmail(imgUrl: String, handler: @escaping (Result<UIImage, Error>)->Void) {
        let urlObj = URL(string: imgUrl)!;
        let task = URLSession.shared.dataTask(with: urlObj) { data, apiResponse, err in
            if let error = err {
                handler(.failure(error))
            }
            guard let httpResponse = apiResponse as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Some Error Occurred....");
                return;
            }
            if let imgData = data {
                let img = UIImage(data: imgData)
                handler(.success(img!))
            }
        }
        task.resume();
    }
    
    func createRecipeIngredients(recipeDetail: RecipeDetailData) -> String {
        var ingredientsText: String = "";
        if var ing = recipeDetail.strIngredient1 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure1 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient2 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure2 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient3 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure3 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient4 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure4 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient5 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure5 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient6 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure6 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient7 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure7 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient8 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure8 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient9 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure9 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient10 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure10 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient11 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure11 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient12 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure12 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient13 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure13 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient14 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure14 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient15 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure15 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient16 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure16 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient17 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure17 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient18 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure18 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient19 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure19 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        if var ing = recipeDetail.strIngredient20 {
            ing = ing.trimmingCharacters(in: .whitespacesAndNewlines);
            if var m = recipeDetail.strMeasure20 {
                m = m.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsText.append(ing == "" ? "" : (ing + (m == "" ? "\n" : ": " + m + "\n")))
            }
        }
        return ingredientsText;
    }
    
}
