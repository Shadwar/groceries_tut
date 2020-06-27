//
//  FreshItemsRepository.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 27.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import Foundation

class FreshItemsRepository: ObservableObject {
    struct Description {
        var authorpic: String
        var authorname: String
        var text: String
    }
    
    struct Item : Identifiable {
        var id : Int
        var name : String
        var price : String
        var image : String
        var description: Description
    }

    @Published var data = [Item]()
    
    func load() -> Void {
        let description = Description(authorpic: "rp1", authorname: "Diana Organic Farm", text: "Organic seedless lemon will enhance the flavor of all your favorite recipes, including chicken, fish, vegetables, and soups without the hassle of picking out the seeds. They are also fantastic in marinades, sauces, and fruit salads.")
        
        data = [
            Item(id: 0, name: "Frozen Fish", price: "20.00 / pcs", image: "f1", description: description),
            Item(id: 1, name: "Seedless Lemon", price: "30.00 / kg", image: "f2", description: description),
            Item(id: 2, name: "Coffee Bread", price: "15.00 / pack", image: "f3", description: description)
        ]
    }
}
