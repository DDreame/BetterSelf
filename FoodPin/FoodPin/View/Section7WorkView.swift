//
//  Section7WorkView.swift
//  FoodPin
//
//  Created by DDreame on 2024/5/7.
//

import SwiftUI



struct FullImageView: View {
    @Binding var restaurant:Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(width: .infinity,height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment:.leading){
                HStack {
                    Text(restaurant.name)
                        .font(.system(.title2, design: .rounded))
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                }
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                Text(restaurant.location)
                    .font(.system(.body, design: .rounded))
                
            }
        }
    }
}



struct BasicTextImageView: View {
    
    @Binding var restaurant:Restaurant
    
    @State private var showOptions = false
    @State private var showError = false
    @State private var showShare = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 10){
            Image(restaurant.image)
                .resizable()
                .scaledToFit()
                .frame(height:90)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment:.leading){
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.location)
                    .font(.system(.body, design: .rounded))
                
            }
            Spacer()
            if restaurant.isFavorite{
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .confirmationDialog("What do you want to du", isPresented: $showOptions, titleVisibility: .visible){
            Button("Reserve a button"){
                self.showError.toggle()
            }
            Button(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite"){
                self.restaurant.isFavorite.toggle()
            }
            Button("Share"){
                self.showShare.toggle()
            }
            
        }
        .contextMenu{
            Button(action :{
                self.showError.toggle()
            }){
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            Button(action :{
                self.restaurant.isFavorite.toggle()
            }){
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
                    Image(systemName: "heart")
                }
            }
            Button(action: {
                self.showShare.toggle()
            }) {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .sheet(isPresented: $showShare){
            let defaultText = "“Just checking in at \(restaurant.name)"
            if let imageToShare = UIImage(named: restaurant.image) {
                    ActivityView(activityItems: [defaultText, imageToShare])
                } else {
                    ActivityView(activityItems: [defaultText])
                }
        }
        .alert("Not yet avaiable", isPresented: $showError){
            Button("Ok"){
                
            }
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later.")
        }
    }
}


//#Preview {
//    FullImageView(restaurant: .constant(Restaurant(name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", image: "cafedeadend", isFavorite: true)))
//}
