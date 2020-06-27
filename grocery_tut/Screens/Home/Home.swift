//
//  Home.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 27.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var search = ""

    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 12) {
                Image("logo")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("Hi, Ivan").font(.body)
                
                Spacer()
                
                Button(action: {}) {
                    Image("filter").renderingMode(.original)
                }
            }
            
            Searcher(label: "Search Groceries", text: $search)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ZStack(alignment: .bottomLeading) {
                        Image("top").renderingMode(.original)
                        Text("GET 20% OFF")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                
                Categories().padding(.top, 10)
                FreshItems().padding(.top, 10)
                Recipes().padding(.top, 10)
            }
        }.padding(.horizontal)
    }
}

struct Home_Previews: PreviewProvider {
    static let freshItemsRepo = FreshItemsRepository()
    static let categoriesRepo = CategoriesRepository()
    static let recipesRepo = RecipesRepository()

    static var previews: some View {
        Home()
            .environmentObject(categoriesRepo)
            .environmentObject(freshItemsRepo)
            .environmentObject(recipesRepo)
    }
}
