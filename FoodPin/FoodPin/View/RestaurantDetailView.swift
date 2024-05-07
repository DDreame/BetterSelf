//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by DDreame on 2024/5/7.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    @Binding var restaurant:Restaurant
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth:0, maxWidth: .infinity)
            .ignoresSafeArea()
            
            Color.black
                .frame(height:100)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                .overlay{
                    VStack(spacing: 5){
                        Text(restaurant.name)
                        Text(restaurant.type)
                        Text(restaurant.location)
                    }
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                }
            
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: .constant(Restaurant(name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", image: "cafedeadend", isFavorite: true)))
}
