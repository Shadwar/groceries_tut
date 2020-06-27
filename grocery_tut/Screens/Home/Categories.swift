//
//  Categories.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 26.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct Categories: View {
    @EnvironmentObject var categoriesRepo: CategoriesRepository

    var body: some View {
        VStack {
            HStack {
                Text("Category").font(.title)

                Spacer()

                Button(action: {}) {
                    Text("More")
                }.foregroundColor(Color("Color"))
            }.padding(.bottom, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(categoriesRepo.data, id: \.self) { category in
                        Button(action: {}) {
                            VStack {
                                Image(category).renderingMode(.original)
                                Text(category).foregroundColor(.black)
                            }
                        }
                    }
                    
                    if categoriesRepo.data.count == 0 {
                        Spacer().frame(height: 30)
                    }
                }
            }
        }.onAppear {
            self.categoriesRepo.load()
        }
    }
}

struct Categories_Previews: PreviewProvider {
    static let categoriesRepo = CategoriesRepository()

    static var previews: some View {
        return Categories().environmentObject(categoriesRepo)
    }
}
