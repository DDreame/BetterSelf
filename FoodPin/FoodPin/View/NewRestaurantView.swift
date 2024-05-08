//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by DDreame on 2024/5/8.
//

import SwiftUI

struct NewRestaurantView: View {
    
    @State private var restaurantImage = UIImage(named: "newphoto")!
    @State private var showPhotoOptions = false
    @State var restaurantName = ""
    @State private var photoSource: PhotoSouce?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Image(uiImage: restaurantImage)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0,maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.bottom)
                        .onTapGesture {
                            self.showPhotoOptions.toggle()
                        }
                    
                    FormTextField(label: "NAME", placeholder: "Fill in restaurant name", value: $restaurantName)
                    FormTextField(label: "TYPE", placeholder: "Fill in the restaurant type", value: .constant(""))

                    FormTextField(label: "ADDRESS", placeholder: "Fill in the restaurant address", value: .constant(""))

                    FormTextField(label: "PHONE", placeholder: "Fill in the restaurant phone", value: .constant(""))

                    FormTextView(label: "DESCRIPTION", value: .constant(""), height: 100)
                }
                .padding()
            }
            .navigationTitle("New Restaurant")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .tint(.primary)
                    }

                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(Color("NavigationBarTitle"))
                }
            }
        }
        .confirmationDialog("Choose your photo source", isPresented: $showPhotoOptions, titleVisibility: .visible){
            Button("Camera") {
                self.photoSource = .camera
            }

            Button("Photo Library") {
                self.photoSource = .photoLibrary
            }
        }
        .fullScreenCover(item:$photoSource){ source in
            switch source {
                case .photoLibrary: ImagePicker(sourceType: .photoLibrary, selectedImage: $restaurantImage).ignoresSafeArea()
                case .camera: ImagePicker(sourceType: .camera, selectedImage: $restaurantImage).ignoresSafeArea()
            }
        }
    }
    
    enum PhotoSouce:Identifiable{
        case photoLibrary
        case camera
        
        var id: Int{
            hashValue
        }
    }
}

struct FormTextField: View{
    let label: String
    var placeholder: String = ""
    
    @Binding var value: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(.darkGray))
            TextField(placeholder, text: $value)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5),lineWidth: 1)
                )
            .padding(.vertical, 10)
        }
    }
}
struct FormTextView: View{
    let label: String
    var placeholder: String = ""
    @Binding var value: String
    var height: CGFloat = 200.0
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(label.uppercased())
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(Color(.darkGray))
                
                TextEditor(text: $value)
                    .frame(maxWidth: .infinity)
                    .frame(height: height)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(.systemGray5), lineWidth: 1)
                    )
                    .padding(.top, 10)
            }
        }
    }
}


#Preview {
    NewRestaurantView()
}
