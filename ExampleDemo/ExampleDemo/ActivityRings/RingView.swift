//
//  RingView.swift
//  ExampleDemo
//
//  Created by DDreame on 2024/5/19.
//

import HealthKitUI
import SwiftUI
import UIKit

struct RingActivity: UIViewRepresentable {
    @Binding var activitySummary: HKActivitySummary
    
    func makeUIView(context: Context) -> HKActivityRingView {
        return HKActivityRingView()
    }
    
    func updateUIView(_ uiView: HKActivityRingView, context: Context) {
        uiView.setActivitySummary(activitySummary, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: RingActivity
        
        init(_ ringView: RingActivity) {
            self.parent = ringView
        }
    }
}
