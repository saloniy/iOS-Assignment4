//
//  ViewController.swift
//  yummy-recipes
//
//  Created by user202495 on 11/21/21.
//

import UIKit

class ViewController: UIViewController,
                      UITableViewDelegate,
                      UITableViewDataSource {
    
    lazy var categories = [CategoryData]();
    lazy var tableData = [DataWithImage]();
    @IBOutlet weak var myTable: UITableView!
    var categorySelected: String = "";
    
    @IBOutlet weak var categoryLabel: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! RecipeTableViewCell;
        let item = tableData[indexPath.row];
        tableCell.categoryImage.image = item.img;
        tableCell.categoryTitle.text = item.name;
        return tableCell;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        categoryLabel.text = "Loading Categories...."
        RecipeServiceController.shared.getMealCategories { results in
            DispatchQueue.main.async {
                self.categories = results.categories;
                
                for (index,category) in self.categories.enumerated() {
                    RecipeServiceController.shared.getImageThubmail(imgUrl: category.strCategoryThumb) { result in
                        switch(result) {
                        case .success(let image):
                            DispatchQueue.main.async {
                                self.tableData.append(DataWithImage(id: category.idCategory, name: category.strCategory, img: image));
                                if(index == self.categories.count - 1) {
                                    self.myTable.reloadData();
                                    self.categoryLabel.text = "Select a Category";
                                }
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? RecipeTableViewController;
        let index = myTable.indexPathForSelectedRow;
        destination!.recipeCategory = tableData[index!.row].name;
    }


}

