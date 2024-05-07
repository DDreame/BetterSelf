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
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isFavorite: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkee", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haigh", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "waffleandwolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanis",location: "London", image: "barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask", isFavorite: false)
    ]

    @State private var restaurantFavorites = Array(repeating: false, count: 21)
    
    @Environment(\.dismiss) var dissmiss
    
    // MARK: base body
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants.indices, id: \.self) { index in
                    NavigationLink(
                        destination:
                            RestaurantDetailView(
                                restaurant: $restaurants[index]
                            )
                            
                    ){
                        BasicTextImageView(
                            restaurant: $restaurants[index]
                        )
                        .swipeActions(edge: .leading, allowsFullSwipe: false){
                            Button{
                            } label:{
                                Image(systemName: "heart")
                            }
                            .tint(.green)
                            Button{
                            } label:{
                                Image(systemName: "square.and.arrow.up")
                            }
                            .tint(.blue)
                            Button{
                            } label:{
                                Image(systemName: "heart")
                            }
                            .tint(.red)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Food Pin")
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
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

