//
//  FreshItems.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 27.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct Recipes: View {
    @EnvironmentObject var recipesRepo: RecipesRepository

    var body: some View {
        VStack {
            HStack {
                Text("Recipes").font(.title)

                Spacer()
                
                Button(action: {}) {
                    Text("More")
                }.foregroundColor(Color("Color"))
            }.padding(.bottom, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(recipesRepo.data) { item in
                        Button(action: {}) {
                            VStack(spacing: 8) {
                                Image(item.image).renderingMode(.original)
                                
                                HStack {
                                    Image(item.authorpic).renderingMode(.original)
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.name).fontWeight(.bold).foregroundColor(.black)
                                        Text(item.author).foregroundColor(.green)
                                    }
                                }
                            }
                        }
                    }
                    
                    if recipesRepo.data.count == 0 {
                        Spacer().frame(height: 240)
                    }
                }
            }
        }.onAppear {
            self.recipesRepo.load()
        }
    }
}

struct Recipes_Previews: PreviewProvider {
    static let recipesRepo = RecipesRepository()

    static var previews: some View {
        Recipes().environmentObject(recipesRepo)
    }
}
