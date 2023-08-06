//
//  ContentView.swift
//  PlantTheSeed
//
//  Created by Dmitrii Galatskii on 06.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pathProgress = 0.0
    @State private var isOn = true
    @State private var start = false
    @State private var startTwo = false
    @State private var startThree = false
    @State private var startFour = false
    @State private var startFive = false
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Gradient(colors: [.black, .brown, .black]))
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    PlantSkeletonView()
                        .trim(from: 0.0, to: pathProgress)
                        .fill(Gradient(colors: [.green, .black]))
                        .shadow(color: .green, radius: 3)
                        .shadow(color: .black, radius: 1)
                        .scaleEffect(startFive ? 0.9 : 0.95)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .offset(x: -30, y: startFive ? -75 : -80)
                        .rotationEffect(.degrees(start ? -20 : -10))
                        .onAppear() {
                            withAnimation(
                                .easeInOut(duration: 2).repeatForever().delay(2)
                            ) {
                                startFive = true
                                
                            }
                        }
                    
                    PlantSkeletonView()
                        .trim(from: 0.0, to: pathProgress)
                        .fill(Gradient(colors: [.green, .black]))
                        .shadow(color: .green, radius: 3)
                        .shadow(color: .black, radius: 1)
                        .scaleEffect(start ? 1 : 1.1)
                        .offset(x: start ? 5 : 0, y: start ? 0 : -40)
                        .rotationEffect(.degrees(start ? 1 : -2))
                        .onAppear() {
                            withAnimation(
                                .easeInOut(duration: 4).repeatForever().delay(2)
                            ) {
                                start = true
                                
                            }
                        }
                        
                    
                    PlantSkeletonView()
                        .trim(from: 0.0, to: pathProgress)
                        .fill(Gradient(colors: [.black, .green, .black]))
                        .rotationEffect(.degrees(startTwo ? -30 : -25), anchor: .bottom)
                        .offset(x: -30, y: 68)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .shadow(color: .green, radius: 5)
                        .shadow(color: .black, radius: 1)
                        .scaleEffect(0.7)
                        .onAppear() {
                            withAnimation(
                                .easeInOut(duration: 4).repeatForever().delay(3)
                            ) {
                                startTwo.toggle()
                            }
                        }
                    
                    PlantSkeletonView()
                        .trim(from: 0.0, to: pathProgress)
                        .fill(Gradient(colors: [.black, .green, .black]))
                        .rotationEffect(.degrees(startFour ? 7 : 7), anchor: .bottom)
                        .offset(x: 0, y: 160)
                        .shadow(color: .green, radius: 5)
                        .shadow(color: .black, radius: 1)
                        .scaleEffect(startFour ? 0.8: 0.75)
                        .onAppear() {
                            withAnimation(
                                .easeInOut(duration: 5).repeatForever().delay(1)
                            ) {
                                startFour.toggle()
                            }
                        }
                    
                    PlantSkeletonView()
                        .trim(from: 0.0, to: pathProgress)
                        .fill(Gradient(colors: [.black, .green, .black]))
                        .rotationEffect(.degrees( startThree ? -45 : -40), anchor: .bottom)
                        .offset(x: 80, y: 100)
                        .shadow(color: .green, radius: 5)
                        .shadow(color: .black, radius: 2)
                        .scaleEffect(0.6)
                        .onAppear() {
                            withAnimation(
                                .easeInOut(duration: 3).repeatForever().delay(2)
                            ) {
                                startThree.toggle()
                            }
                        }
                        
                    Circle()
                        .trim(from: 0, to: 0.5)
                        
                        .fill(RadialGradient(colors: [.white, .black], center: .center, startRadius: 1, endRadius: 110))
                        
                        
                        
                        
                        .frame(width: 200, height: 300)
                        .overlay(Circle()
                            .trim(from: 0, to: 0.5)
                            .stroke(lineWidth: 5))
                        .blendMode(.plusLighter)
                        .scaledToFit()
                        .position(x: 200, y: 480)
                        .shadow(color: .black, radius: 5)
                        
                        

                }
                
                
        
                
                SliderView(pathProgress: $pathProgress, timer: $timer, stopTimer: stopTimer)
                    .shadow(color: .green, radius: 10)
                    .shadow(color: .green, radius: 20)
                
                HStack {
                    Button {
                        start = false
                        isOn = false
                        withAnimation {
                            pathProgress = 0
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
                        start = true
                        isOn = true
                        startTimer()
                    } label: {
                        Image(systemName: pathProgress < 0.99 ? "play.fill" : "stop.fill")
                            .resizable()
                            .rotationEffect(.degrees(isOn ? 360 : 0))
                            .animation(.linear, value: isOn)
                            .frame(width: 40, height: 40)
                            .foregroundColor(pathProgress < 0.05 ? .green : .gray)
                            .bold()
                    }
                    .disabled(pathProgress > 0)
                    .padding(.leading, 70)
                    .animation(.linear(duration: 0.2), value: pathProgress)
                }
                .padding()
                .shadow(color: .green, radius: 20)
                
            }
        }
    }
    
    private func startTimer() {
        timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
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
