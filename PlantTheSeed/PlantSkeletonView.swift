//
//  PlantSkeletonView.swift
//  PlantTheSeed
//
//  Created by Dmitrii Galatskii on 06.08.2023.
//

import SwiftUI

struct PlantSkeletonView: Shape {
    func path(in rect: CGRect) -> Path {
        
            Path { path in
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 200, y: 400), control: CGPoint(x: 210, y: 300))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 230, y: 300), control: CGPoint(x: 210, y: 300))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 180, y: 300), control: CGPoint(x: 170, y: 20))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 100, y: 300), control: CGPoint(x: 80, y: 300))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 150, y: 300), control: CGPoint(x: 160, y: 380))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 330, y: 300), control: CGPoint(x: 300, y: 300))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 260, y: 260), control: CGPoint(x: 280, y: 300))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 280, y: 300), control: CGPoint(x: 290, y: 300))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 200, y: 100), control: CGPoint(x: 180, y: 400))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 300, y: 100), control: CGPoint(x: 250, y: 400))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 80, y: 200), control: CGPoint(x: 180, y: 400))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 130, y: 150), control: CGPoint(x: 200, y: 400))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 230, y: 150), control: CGPoint(x: 200, y: 400))
                
                path.move(to: CGPoint(x: 200, y: 500))
                path.addQuadCurve(to: CGPoint(x: 250, y: 30), control: CGPoint(x: 200, y: 300))
            }
        
        }
    
    }


struct PlantSkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        PlantSkeletonView()
    }
}
