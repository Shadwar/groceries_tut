//
//  FreshItems.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 27.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct FreshItems: View {
    @EnvironmentObject var freshItemsRepo: FreshItemsRepository

    var body: some View {
        VStack {
            HStack {
                Text("Fresh New Item").font(.title)

                Spacer()
                
                Button(action: {}) {
                    Text("More")
                }.foregroundColor(Color("Color"))
            }.padding(.bottom, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(freshItemsRepo.data) { item in
                        FreshItem(data: item)
                    }
                    
                    if freshItemsRepo.data.count == 0 {
                        Spacer().frame(height: 240)
                    }
                }
            }
        }.onAppear {
            self.freshItemsRepo.load()
        }
    }
}

struct FreshItems_Previews: PreviewProvider {
    static let freshItemsRepo = FreshItemsRepository()

    static var previews: some View {
        FreshItems().environmentObject(freshItemsRepo)
    }
}
