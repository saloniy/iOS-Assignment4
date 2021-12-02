//
//  RecipeTableViewController.swift
//  yummy-recipes
//
//  Created by user202495 on 11/21/21.
//

import UIKit

class RecipeTableViewController: UITableViewController {

    lazy var recipes = [RecipeData]();
    lazy var tableData = [DataWithImage]();
    var recipeCategory: String = "";
    
    @IBOutlet weak var recipeListHeading: UINavigationItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeListHeading.title = "Loading Recipes..."
        self.tableView.rowHeight = 100.0
        RecipeServiceController.shared.getMealRecipes(category: recipeCategory) { result in DispatchQueue.main.async {
                self.recipes = result.meals;
                for (index, recipe) in self.recipes.enumerated() {
                    RecipeServiceController.shared.getImageThubmail(imgUrl: recipe.strMealThumb) {
                        result in switch(result) {
                        case .success(let image):
                            DispatchQueue.main.async {
                                self.tableData.append(DataWithImage(id: recipe.idMeal, name: recipe.strMeal, img: image));
                                if(index == self.recipes.count-1){
                                    self.tableView.reloadData();
                                    self.recipeListHeading.title = "Recipe List"
                                }
                            }
                        case .failure(let error):
                            print(error);
                        }
                    }
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "recipeTitle", for: indexPath) as! RecipeTableViewCell;
        let item = tableData[indexPath.row];
        tableCell.recipeImage.image = item.img;
        tableCell.recipeTitle.text = item.name;
        return tableCell;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
