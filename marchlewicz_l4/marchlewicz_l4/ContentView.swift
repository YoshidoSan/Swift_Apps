//
//  marchlewicz_l4App.swift
//  marchlewicz_l4
//
//  Created by Kacper Marchlewicz on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation: Double = 0.0
    @State private var max_ball_count = 10
    @State private var show1 = true
    
    var body: some View {
        ZStack {
            Image("blackhole2")
                .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 0, z: 1))
                .animation(
                    Animation.linear(duration: 10)
                        .repeatForever(autoreverses: false)
                            )
                .onAppear {
                    self.rotation -= 360
                          }
                .scaleEffect(1.5)
            Ball()
            Ball()
        }
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



