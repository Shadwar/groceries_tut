//
//  FreshItem.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 27.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct FreshItem: View {
    let data: FreshItemsRepository.Item
    @State var show = false

    var body: some View {
        ZStack {
            NavigationLink(destination: FreshItemDetails(data: self.data, show: $show), isActive: $show) {
                Text("")
            }

            VStack(spacing: 8) {
                Image(data.image).renderingMode(.original)
                Text(data.name).fontWeight(.bold).foregroundColor(.black)
                Text(data.price).foregroundColor(.green)
            }.onTapGesture {
                self.show.toggle()
            }
        }
    }
}

struct FreshItem_Previews: PreviewProvider {
    static var previews: some View {
        FreshItem(data: .init(id: 0, name: "Frozen Fish", price: "20.00 / pcs", image: "f1", description: .init(authorpic: "rp1", authorname: "name", text: "description")))
    }
}
