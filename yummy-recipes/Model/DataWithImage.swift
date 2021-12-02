//
//  DataWithImage.swift
//  yummy-recipes
//
//  Created by user202495 on 12/1/21.
//

import Foundation
import UIKit

class DataWithImage {
    var id: String;
    var name: String;
    var img: UIImage;
    
    init(id: String, name: String, img: UIImage) {
        self.id = id;
        self.name = name;
        self.img = img;
    }
}
