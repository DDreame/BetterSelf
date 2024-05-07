//
//  ActivityView.swift
//  FoodPin
//
//  Created by DDreame on 2024/5/7.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let x = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        
        return x
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

//#Preview {
//    ActivityView()
//}
