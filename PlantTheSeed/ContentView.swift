//
//  ContentView.swift
//  PlantTheSeed
//
//  Created by Dmitrii Galatskii on 06.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pathProgress = 0.0
    @State private var isOn = false
    @State private var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Gradient(colors: [.black, .brown, .black]))
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    PlantSkeletonView()
                        .trim(
                            from: isOn ? 0.0 : pathProgress,
                            to: isOn ? pathProgress : 0.0)
                        .fill(Gradient(colors: [.green, .green, .brown, .black]))
                        .shadow(color: .green, radius: 3)
                        .shadow(color: .yellow, radius: 1)
                    
                    PlantSkeletonView()
                        .trim(
                            from: isOn ? 0.0 : pathProgress,
                            to: isOn ? pathProgress : 0.0)
                        .fill(Gradient(colors: [.green, .green, .brown, .black]))
                        .rotationEffect(.degrees(30), anchor: .bottom)
                        .offset(x: -50, y: 68)
                        .shadow(color: .green, radius: 5)
                        .shadow(color: .yellow, radius: 1)
                        .scaleEffect(0.7)
                    
                    PlantSkeletonView()
                        .trim(
                            from: isOn ? 0.0 : pathProgress,
                            to: isOn ? pathProgress : 0.0)
                        .fill(Gradient(colors: [.green, .green, .brown, .black]))
                        .rotationEffect(.degrees(-45), anchor: .bottom)
                        .offset(x: 80, y: 100)
                        .shadow(color: .green, radius: 5)
                        .shadow(color: .yellow, radius: 1)
                        .scaleEffect(0.6)
                    
                }
                
                SliderView(pathProgress: $pathProgress, timer: $timer, stopTimer: stopTimer)
                    
                    .shadow(color: .green, radius: 20)
                
                HStack {
                    Button {
                        
                        withAnimation {
                            repeat { pathProgress -= 0.01
                            } while pathProgress > 0
                                
                        }
                        
                        if pathProgress == 0 {
                            isOn.toggle()
                        }
                            
                        
                        
                    } label: {
                        Image(systemName: "leaf.arrow.circlepath")
                            .resizable()
                            .frame(width: 35, height: 40)
                            .foregroundColor(pathProgress >= 0.9 ? .green : .gray)
                            .bold()
                        
                    }
                    .disabled(pathProgress < 0.99)
                    
                    Button {
                        isOn = true
                        startTimer()
                        
                        
                    } label: {
                        
                            
                            
                        Image(systemName: pathProgress < 0.99 ? "play.fill" : "pause.fill")
                                .resizable()
                                .rotationEffect(.degrees(isOn ? 360 : 0))
                                .animation(.linear, value: isOn)
                                
                                
                                .frame(width: 40, height: 40)
                                .foregroundColor(pathProgress < 0.05 ? .green : .gray)
                                .bold()
                        
                    
                            
                    }
                    .disabled(pathProgress > 0)
                    .padding(.leading, 70)
                    
                }
                
                .padding()
                .shadow(color: .green, radius: 20)
                .animation(.linear(duration: 0.2), value: pathProgress)
            }
            
        }
        
        
    }
    
    private func startTimer() {
        timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    }
    
    private func rewindTimer() {
        
    }
    
    private func stopTimer() {
        timer.upstream.connect().cancel()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
