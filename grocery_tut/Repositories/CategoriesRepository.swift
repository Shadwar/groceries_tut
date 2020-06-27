//
//  CategoriesRepository.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 27.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import Foundation

class CategoriesRepository: ObservableObject {
    @Published var data = [String]()
    
    func load() -> Void {
        data = ["Fruits","Vegetables","Beverages","Fish","Breads"]
    }
}
