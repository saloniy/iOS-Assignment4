//
//  FavoritesServiceController.swift
//  yummy-recipes
//
//  Created by user202495 on 12/3/21.
//

import Foundation
import CoreData

class FavoritesServiceController {
    
    static var shared = FavoritesServiceController();
    
    func addFavorite(id: String, name: String, instructions: String, image: Data) -> FavoriteRecipes {
        let newFavRecipe = FavoriteRecipes(context: persistentContainer.viewContext)
        var result: [FavoriteRecipes] = [];
        newFavRecipe.id = id;
        newFavRecipe.name = name;
        newFavRecipe.instructions = instructions;
        newFavRecipe.image = image;
        saveContext();
        let fetchRequest: NSFetchRequest<FavoriteRecipes> = FavoriteRecipes.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", id as CVarArg);
        fetchRequest.predicate = predicate
        do {
            result = try persistentContainer.viewContext.fetch(fetchRequest);
            return result.first!;
        } catch {
            print("Error");
        }
        return result.first!;
    }
    
    func deleteFavorite(toDelete: FavoriteRecipes) {
        persistentContainer.viewContext.delete(toDelete);
        saveContext();
    }
    
    func getAllFavorites() -> [FavoriteRecipes] {
        var allFavorites = [FavoriteRecipes]()
        let fetchRequest: NSFetchRequest<FavoriteRecipes> = FavoriteRecipes.fetchRequest()
        do {
            allFavorites = try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Error");
        }
        return allFavorites
    }
    
    func favoriteExsists(id: String) -> Bool {
        var favExists = false;
        let fetchRequest: NSFetchRequest<FavoriteRecipes> = FavoriteRecipes.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", id as CVarArg);
        fetchRequest.predicate = predicate
        do {
            let result = try persistentContainer.viewContext.fetch(fetchRequest);
            favExists = (result.count > 0);
        } catch {
            print("Error");
        }
        return favExists
    }
    
    //    func deleteAllData() {
    //        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteRecipes")
    //            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    //            do {
    //                try persistentContainer.viewContext.execute(deleteRequest)
    //            } catch let error as NSError {
    //                debugPrint(error)
    //            }
    //    }
        
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "yummy_recipes")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
