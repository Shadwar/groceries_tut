//
//  ContentView.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 25.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selected = tabs[0]

    var body: some View {
        NavigationView {
            VStack {
                if selected == tabs[0] {
                    Home()
                } else if selected == tabs[1] {
                    Text("Wishlist")
                } else if selected == tabs[2] {
                    Text("Cart")
                }

                Spacer()
                Tabs(selected: $selected)
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let categoriesRepo = CategoriesRepository()
    static let freshItemsRepo = FreshItemsRepository()
    static let recipesRepo = RecipesRepository()

    static var previews: some View {
        return ContentView()
            .environmentObject(categoriesRepo)
            .environmentObject(freshItemsRepo)
            .environmentObject(recipesRepo)
    }
}
