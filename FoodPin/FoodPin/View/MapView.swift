//
//  MapView.swift
//  FoodPin
//
//  Created by DDreame on 2024/5/8.
//

import SwiftUI
import MapKit

struct MapView: View {
    var location: String = ""
    var interactionMode: MapInteractionModes = .all
    
    @State private var mapLocation = CLLocation()
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $position, interactionModes: interactionMode){
            Marker("", coordinate: mapLocation.coordinate)
                .tint(.red)
        }
        .task {
            convertAddress(location: location)
        }
    }
    
    private func convertAddress(location: String){
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(location, completionHandler: {
            placemarks, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let placemarks = placemarks,
                  let location = placemarks[0].location else {
                return
            }
            let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
            
            self.position = .region(region)
            self.mapLocation = location
        })
    }
}

#Preview {
    MapView(location: "北京市第二中学")
}
