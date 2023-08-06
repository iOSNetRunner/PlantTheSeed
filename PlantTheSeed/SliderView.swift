//
//  SliderView.swift
//  PlantTheSeed
//
//  Created by Dmitrii Galatskii on 06.08.2023.
//

import SwiftUI
import Combine

struct SliderView: View {
    
    @Binding var pathProgress: Double
    @Binding var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    
    
    
    let stopTimer: () -> Void
    
    var body: some View {
        
        HStack {
            Image(systemName: "leaf")
                .resizable()
                .frame(width: 25, height: 20)
            
            
                
            Slider(value: $pathProgress, in: 0.0...1.0).onReceive(timer) { _ in
                
                if pathProgress < 1 {
                    pathProgress += 0.004
                    
                    if pathProgress > 1 {
                        stopTimer()
                    }
                    
                
                }
            }
            
            
            .onAppear() {
                stopTimer()
            }
                .tint(.green)
                
                .animation(.linear, value: pathProgress)
            
            Image(systemName: "leaf.fill")
                .resizable()
                .frame(width: 25, height: 20)
        }
        .foregroundColor(.green)
        
        .padding()
        
        
        
    }
}
