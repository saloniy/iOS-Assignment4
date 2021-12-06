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
    var recipeData: FavoriteRecipes?;
    var recipeId: String = "";
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeInstructions: UITextView!
    @IBOutlet weak var recipeHeading: UILabel!
    @IBOutlet weak var favoritesBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        if((recipeData?.id?.isEmpty ?? true)) {
            RecipeServiceController.shared.getMealRecipeDetails(recipe: recipeTitle) { results in DispatchQueue.main.async {
                    self.recipeDetails = results.meals;
                    RecipeServiceController.shared.getImageThubmail(imgUrl: self.recipeDetails[0].strMealThumb) { result in switch(result) {
                        case .success(let image):
                            DispatchQueue.main.async {
                                self.recipeId = self.recipeDetails[0].idMeal;
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
        } else {
            recipeId = (recipeData?.id)!;
            recipeHeading.text = recipeData?.name;
            recipeInstructions.text = recipeData?.instructions;
            recipeImage.image = UIImage(data: (recipeData?.image)!);
            favoritesBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        
    }
    
    func createRecipeInstructions() {
        let recipeDetail = recipeDetails[0];
        let ingredientsText: String = RecipeServiceController.shared.createRecipeIngredients(recipeDetail: recipeDetail);
        let instructionsText = "\nInstructions: \n" + recipeDetail.strInstructions;
        recipeInstructions.text = "Ingredients: \n";
        recipeInstructions.text?.append(ingredientsText)
        recipeInstructions.text?.append(instructionsText);
    }
    
    @IBAction func addToFavorites(_ sender: Any) {
        let favoritesButton = (sender as! UIButton);
        let savedId = recipeId.isEmpty ? (recipeDetails.count > 0 ? recipeDetails[0].idMeal : recipeData!.id) : recipeId;
        if(FavoritesServiceController.shared.favoriteExsists(id: savedId!)) {
            favoritesButton.setImage(UIImage(systemName: "star"), for: .normal)
            FavoritesServiceController.shared.deleteFavorite(toDelete: recipeData!);
        } else {
            favoritesButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            recipeData = FavoritesServiceController.shared.addFavorite(id: savedId!, name: recipeHeading.text!, instructions: recipeInstructions.text, image: (recipeImage.image?.pngData())!)

            
            }
        }
    
}
