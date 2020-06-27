//
//  RecipesRepository.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 27.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import Foundation


class RecipesRepository: ObservableObject {
    struct Item: Identifiable {
        var id : Int
        var name : String
        var author : String
        var image : String
        var authorpic : String
    }
    
    @Published var data = [Item]()
    
    func load() -> Void {
        data = [
            Item(id: 0, name: "Basil Pasta", author: "Karlien Nijhuis", image: "r1", authorpic: "rp1"),
            Item(id: 1, name: "Banana Rice", author: "Harmen Porter", image: "r2", authorpic: "rp2"),
            Item(id: 2, name: "Ramen", author: "Marama Peter", image: "r3", authorpic: "rp3")
        ]
    }
}
