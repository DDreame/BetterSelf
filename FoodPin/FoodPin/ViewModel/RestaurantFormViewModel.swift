//
//  RestaurantFormViewModel.swift
//  FoodPin
//
//  Created by DDreame on 2024/5/8.
//

import SwiftUI

@Observable class RestaurantFormViewModel {

    // Input
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var phone: String = ""
    var summary: String = ""
    var image: UIImage = UIImage()
    var isFavorite: Bool = false

    init(restaurant: Restaurant? = nil) {

        if let restaurant = restaurant {
            self.name = restaurant.name
            self.type = restaurant.type
            self.location = restaurant.location
            self.phone = restaurant.phone
            self.summary = restaurant.summary
            self.image = restaurant.image
            self.isFavorite = restaurant.isFavorite
        }

    }
}
