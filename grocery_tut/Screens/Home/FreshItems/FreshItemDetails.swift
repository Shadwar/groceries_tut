//
//  FreshItemDetails.swift
//  grocery_tut
//
//  Created by  Иван Ощепков on 27.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct FreshItemDetails: View {
    let data: FreshItemsRepository.Item
    @Binding var show: Bool

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                Image(data.image)
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height / 2.5)
                
                HStack(spacing: 12) {
                    Button(action: { self.show.toggle() }) {
                        Image("back").renderingMode(.original)
                    }

                    Spacer()
                    
                    Image("download").renderingMode(.original)
                    Image("Wishlist").renderingMode(.original)
                }.padding()
                .padding(.top, 20)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    Text(data.name).font(.title)
                    Text(data.price).foregroundColor(.gray)
                    
                    Divider().padding(.vertical, 15)
                    
                    Description(data: data.description)
                    Reviews().padding(.top, 15)
                }
            }
            .overlay(Likes())
            .padding()
            .background(RoundedCorner().fill(Color.white))
            .padding(.vertical, -25)

            CartCount().padding(.top, 10)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FreshItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        
        FreshItemDetails(data: .init(id: 0, name: "Frozen Fish", price: "20.00 / pcs", image: "f1", description: .init(authorpic: "rp1", authorname: "Diana Organic Farm", text: "Organic seedless lemon will enhance the flavor of all your favorite recipes, including chicken, fish, vegetables, and soups without the hassle of picking out the seeds. They are also fantastic in marinades, sauces, and fruit salads.")), show: .constant(true))
    }
}

struct Likes: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()

                HStack {
                    Text("4").foregroundColor(.white)
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }.padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }.padding(.top, -40)
                .padding(.trailing)

            Spacer()
        }
    }
}

struct Description: View {
    let data: FreshItemsRepository.Description

    var body: some View {
        VStack {
            HStack {
                Image(data.authorpic).renderingMode(.original)
                Text(data.authorname).fontWeight(.bold)
                Spacer()
                
                Button(action: {}) {
                    Image("chat").renderingMode(.original)
                }
            }
            
            Text(data.text).foregroundColor(.gray)
        }
    }
}

struct Reviews: View {
    var body: some View {
        VStack {
            HStack {
                Text("Reviews (50)")

                Spacer()

                Button(action: {}) {
                    Text("More").foregroundColor(Color("Color"))
                }
            }
            
            HStack(spacing: 15) {
                Image("rp2").renderingMode(.original)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("4")
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                    }
                    
                    Text("Oh Yeon Seo").fontWeight(.medium)
                    Text("The lemon is so fresh and delivery is s...")
                        .foregroundColor(.gray)
                }
            }.padding()
                .background(Color("Color1"))
            .cornerRadius(12)
        }
    }
}

struct CartCount: View {
    @State var count = 0

    var body: some View {
        HStack(spacing: 20) {
            Spacer(minLength: 12)

            Button(action: { self.count += 1 }) {
                Image(systemName: "plus.circle").font(.largeTitle)
            }.foregroundColor(.green)
            
            Text("\(count)")

            Button(action: {
                if self.count > 0 {
                    self.count -= 1
                }
            }) {
                Image(systemName: "minus.circle").font(.largeTitle)
            }.foregroundColor(.green)
            
            Button(action: {}) {
                Text("Add to cart").padding()
            }.foregroundColor(.white)
            .background(Color("Color"))
            .cornerRadius(12)
            
            Spacer(minLength: 12)
        }.padding()
    }
}
