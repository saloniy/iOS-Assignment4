//
//  FavoritesTableViewController.swift
//  yummy-recipes
//
//  Created by user202495 on 12/3/21.
//

import UIKit
import CoreData

class FavoritesTableViewController: UITableViewController {
    
    var favRecipes = [FavoriteRecipes]();

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 100.0;
        favRecipes = FavoritesServiceController.shared.getAllFavorites();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);
        favRecipes = FavoritesServiceController.shared.getAllFavorites();
        tableView.reloadData();
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favRecipes.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favRecipeCell = tableView.dequeueReusableCell(withIdentifier: "favRecipeCell", for: indexPath) as! RecipeTableViewCell;
        if(favRecipes.count > 0) {
            favRecipeCell.favRecipeImage.image = UIImage(data: favRecipes[indexPath.row].image!)
            favRecipeCell.favRecipeTitle.text = favRecipes[indexPath.row].name
        }

        return favRecipeCell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            FavoritesServiceController.shared.deleteFavorite(toDelete: favRecipes[indexPath.row]);
            favRecipes.remove(at: indexPath.row);
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? RecipeViewController;
        let index = self.tableView.indexPathForSelectedRow;
        destination!.recipeData = favRecipes[index!.row];
    }

}
