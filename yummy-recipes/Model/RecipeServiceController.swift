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
    
    func getMealCategories(handler: @escaping (categoryResult)->Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php";
        let urlObj = URL(string: urlString)!;
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
        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=" + category;
        let urlObj = URL(string: urlString)!;
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
    
}
