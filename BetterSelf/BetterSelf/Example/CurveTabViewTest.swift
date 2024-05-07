//
//  CurveTabViewTest.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/5.
//

import SwiftUI

struct Curve: Shape {
    
    private let offsetX = 0.0
    private let curveOffsetX = 0.01
    
    func path(in rect: CGRect) -> Path {
        let h = rect.maxY * 0.7
        
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: .init(x: rect.midX * (1.0 - offsetX) - 50, y: 0))
        
        path.addCurve(to: CGPoint(x: rect.midX, y: h), control1: CGPoint(x: rect.midX * curveOffsetX, y: rect.minY), control2: CGPoint(x: rect.midX * curveOffsetX, y: h))
        
        path.addCurve(to: CGPoint(x: rect.midX * (1.0 + offsetX) + 50, y: rect.minY), control1: CGPoint(x: rect.midX * (2.0 - curveOffsetX), y: h), control2: CGPoint(x: rect.midX * (2.0 - curveOffsetX), y: rect.minY))
        
        path.addLine(to: .init(x: rect.midX * (1.0 + offsetX) + 50, y: 0))
                    
        return path
    }
}

struct CurveTabViewTest: View {
    var body: some View {
        HStack{
            Curve()
                .fill(Color.blue)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            Curve()
                .fill(Color.blue)
                .border(Color.black)
            Curve()
                .fill(Color.blue)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            Curve()
                .fill(Color.blue)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
            Curve()
                .fill(Color.red)
        }
        .frame(maxHeight:50)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CurveTabViewTest()
}
