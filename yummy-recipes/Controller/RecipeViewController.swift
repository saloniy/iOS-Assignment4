//
//  RecipeViewController.swift
//  yummy-recipes
//
//  Created by user202495 on 11/21/21.
//

import UIKit

class RecipeViewController: UIViewController {
    
    var recipeTitle: String = "";
    lazy var recipeDetails = [RecipeDetailData]();
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeInstructions: UITextView!
    @IBOutlet weak var recipeHeading: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RecipeServiceController.shared.getMealRecipeDetails(recipe: recipeTitle) { results in DispatchQueue.main.async {
                self.recipeDetails = results.meals;
                RecipeServiceController.shared.getImageThubmail(imgUrl: self.recipeDetails[0].strMealThumb) { result in switch(result) {
                    case .success(let image):
                        DispatchQueue.main.async {
                            self.recipeImage.image = image;
                            self.recipeHeading.text = self.recipeDetails[0].strMeal;
                            self.createRecipeInstructions();
                        }
                    case .failure(let error):
                        print(error);
                    }
                }
            }
        }
        
    }
    
    func createRecipeInstructions() {
        let recipeDetail = recipeDetails[0];
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
        let instructionsText = "\nInstructions: \n" + recipeDetail.strInstructions;
        recipeInstructions.text = "Ingredients: \n";
        recipeInstructions.text?.append(ingredientsText)
        recipeInstructions.text?.append(instructionsText);
    }
    
    @IBAction func addToFavorites(_ sender: Any) {
        let favoritesButton = (sender as! UIButton);
        favoritesButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    }
    
}
