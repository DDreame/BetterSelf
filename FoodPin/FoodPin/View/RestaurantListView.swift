//
//  ContentView.swift
//  FoodPin
//
//  Created by DDreame on 2024/5/7.
//

import SwiftUI
import SwiftData

struct RestaurantListView: View {
    
    // MARK: Data
    @Query var restaurants: [Restaurant]
    
    @State private var showNewRestaurant = false
    @State private var restaurantFavorites = Array(repeating: false, count: 21)
    
    @Environment(\.dismiss) var dissmiss
    
    // MARK: base body
    var body: some View {
        NavigationStack {
            List {
                if restaurants.count == 0 {
                    Image("emptydata")
                        .resizable()
                        .scaledToFit()
                } else{
                    ForEach(restaurants.indices, id: \.self) { index in
                        //  透视视图
                        ZStack {
                            //  把它隐藏掉
                            NavigationLink(destination: RestaurantDetailView(restaurant: restaurants[index])) {
                                EmptyView()
                            }
                            .opacity(0)
                            // 下面显示卡片
                            BasicTextImageView(restaurant: restaurants[index])
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Food Pin")
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
            .toolbar {
                Button(action: {
                    self.showNewRestaurant = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .tint(.primary)
        .sheet(isPresented: $showNewRestaurant) {
            NewRestaurantView()
        }
    }

}

#Preview {
    RestaurantListView()
}

#Preview("Dark") {
    RestaurantListView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

