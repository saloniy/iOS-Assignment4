//
//  Category.swift
//  yummy-recipes
//
//  Created by user202495 on 11/21/21.
//

import Foundation

struct categoryResult: Codable {
    var categories: [CategoryData];
}

struct CategoryData : Codable {
    var idCategory: String; // category ID
    var strCategory: String; // category name
    var strCategoryThumb: String; // thumbnail image
}
