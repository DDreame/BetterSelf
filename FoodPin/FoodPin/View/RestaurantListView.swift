//
//  ContentView.swift
//  FoodPin
//
//  Created by DDreame on 2024/5/7.
//

import SwiftUI
import SwiftData

struct RestaurantListView: View {
    @AppStorage("hasViewedWalkthrough") var hasViewedWalkthrough: Bool = false
    @State private var showWalkthrough = false
    
    // MARK: Data
    @Query var restaurants: [Restaurant]
    @State private var searchResult: [Restaurant] = []
    @State private var isSearchActive = false
    @State private var showNewRestaurant = false
    @State private var restaurantFavorites = Array(repeating: false, count: 21)
    @Environment(\.dismiss) var dissmiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var searchText:String = ""
    
    // MARK: base body
    var body: some View {
        NavigationStack {
            List {
                if restaurants.count == 0 {
                    Image("emptydata")
                        .resizable()
                        .scaledToFit()
                } else{
                    let listItems = isSearchActive ? searchResult : restaurants
                    
                    ForEach(listItems.indices, id: \.self) { index in
                        //  透视视图
                        ZStack {
                            //  把它隐藏掉
                            NavigationLink(destination: RestaurantDetailView(restaurant: listItems[index])) {
                                EmptyView()
                            }
                            .opacity(0)
                            // 下面显示卡片
                            BasicTextImageView(restaurant: listItems[index])
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
        .searchable(text: $searchText, isPresented: $isSearchActive,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search resturant")
        .onChange(of: searchText) { oldValue, newValue in
            let predicate = #Predicate<Restaurant> { $0.name.localizedStandardContains(newValue) }
            
            let descriptor = FetchDescriptor<Restaurant>(predicate: predicate)
            
            if let result = try? modelContext.fetch(descriptor) {
                searchResult = result
            }
        }
        .searchSuggestions{
            if searchText.isEmpty {
               Text("Cafe").searchCompletion("Cafe")
               Text("Thai").searchCompletion("Thai")
           }
        }
        .sheet(isPresented: $showWalkthrough) {
            TutorialView()
        }
        .onAppear() {
            showWalkthrough = hasViewedWalkthrough ? false : true
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

