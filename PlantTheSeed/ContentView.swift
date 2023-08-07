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
    @State private var lightIsOn = false
    @State private var timer = Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Gradient(colors: [.brown, .brown, .black]))
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .fill(RadialGradient(colors: [.white, .black], center: .center, startRadius: 1, endRadius: 210))
                            .blendMode(.plusLighter)
                            .ignoresSafeArea()
                            
                            
                            .scaleEffect(lightIsOn ? 1.5 : 1)
                            .opacity(lightIsOn ? 1 : 0)
                            .transition(.opacity)
                            .animation(.easeOut(duration: 1.5), value: lightIsOn)
                            .padding(.top, geometry.size.height / -1.3)
                        
                        PlantSkeletonView()
                            .trim(from: 0.0, to: pathProgress)
                            .fill(Gradient(colors: [.green, .black]))
                            .shadow(color: .green, radius: 3)
                            .shadow(color: .black, radius: 1)
                            .scaleEffect(startFive ? 0.9 : 0.95)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .offset(x: geometry.size.width / -6, y: startFive ? geometry.size.height / 25 : geometry.size.height / 24)
                            .rotationEffect(.degrees(startFive ? -25 : -20))
                            .onAppear() {
                                withAnimation(
                                    .easeInOut(duration: 4).repeatForever().delay(4.3)
                                ) {
                                    startFive = true
                                }
                            }
                        
                        PlantSkeletonView()
                            .trim(from: 0.0, to: pathProgress)
                            .fill(Gradient(colors: [.green, .black]))
                            .shadow(color: .green, radius: 3)
                            .shadow(color: .black, radius: 1)
                            .scaleEffect(start ? 1.1 : 1.15)
                            .offset(x: geometry.size.width / 30, y: geometry.size.height / 27)
                            .rotationEffect(.degrees(start ? -3 : 5))
                            .onAppear() {
                                withAnimation(
                                    .easeInOut(duration: 5.2).repeatForever().delay(2.2).speed(2)
                                ) {
                                    start = true
                                }
                            }
                            
                        
                        PlantSkeletonView()
                            .trim(from: 0.0, to: pathProgress)
                            .fill(Gradient(colors: [.black, .green, .black, .black]))
                            .rotationEffect(.degrees(startTwo ? -30 : -25), anchor: .bottom)
                            .offset(x: geometry.size.width / 8, y: geometry.size.height / 6)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .shadow(color: .green, radius: 5)
                            .shadow(color: .black, radius: 1)
                            .scaleEffect(0.7)
                            .onAppear() {
                                withAnimation(
                                    .easeInOut(duration: 4).repeatForever().delay(3)
                                ) {
                                    startTwo = true
                                }
                            }
                        
                        PlantSkeletonView()
                            .trim(from: 0.0, to: pathProgress)
                            .fill(Gradient(colors: [.black, .green, .black, .black]))
                            .rotationEffect(.degrees(startFour ? -3 : 3), anchor: .bottom)
                            .offset(x: geometry.size.width / -65, y: geometry.size.height / 5)
                            .shadow(color: .green, radius: 5)
                            .shadow(color: .black, radius: 1)
                            .scaleEffect(startFour ? 0.8: 0.75)
                            .onAppear() {
                                withAnimation(
                                    .easeInOut(duration: 5).repeatForever().delay(1)
                                ) {
                                    startFour = true
                                }
                            }
                        
                        PlantSkeletonView()
                            .trim(from: 0.0, to: pathProgress)
                            .fill(Gradient(colors: [.black, .green, .black, .black]))
                            .rotationEffect(.degrees( startThree ? -40 : -35), anchor: .bottom)
                            .offset(x: geometry.size.width / 5, y: geometry.size.height / 6)
                            .shadow(color: .green, radius: 5)
                            .shadow(color: .black, radius: 2)
                            .scaleEffect(0.6)
                            .onAppear() {
                                withAnimation(
                                    .easeInOut(duration: 3).repeatForever().delay(2)
                                ) {
                                    startThree = true
                                }
                            }
                            
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .fill(RadialGradient(colors: [.white, .brown, .black], center: .center, startRadius: 1, endRadius: 110))
                            .frame(width: 200, height: 300, alignment: .center)
                            .overlay(Circle()
                                .trim(from: 0, to: 0.5)
                                .stroke(lineWidth: 5))
                            .blendMode(.plusLighter)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 1.75)
                            .scaleEffect(1.3)
                            .shadow(color: .black, radius: 2)
                    }
                    
                    SliderView(pathProgress: $pathProgress, timer: $timer, stopTimer: stopTimer)
                        .shadow(color: .green, radius: 10)
                        .shadow(color: .green, radius: 20)
                    
                    
                    HStack {
                        Button {
                            start = false
                            startTwo = false
                            startThree = false
                            startFour = false
                            startFive = false
                            lightIsOn = false
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
                            startTwo = true
                            startThree = true
                            startFour = true
                            startFive = true
                            lightIsOn = true
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
    }
    
    private func startTimer() {
        timer = Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()
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
