//
//  Ball.swift
//  marchlewicz_l4
//
//  Created by Kacper Marchlewicz on 15/05/2023.
//

import Foundation
import SwiftUI

struct Ball: View {
    @State private var rotation2: Double = 10.0
    @State private var Scale = 0.1
    @State private var position = getCoords()
    @State private var show = true
    var body: some View {
        if self.show{
        Image("Dragonball")
             .scaleEffect(Scale)
             .offset(position)
             .rotation3DEffect(.degrees(rotation2), axis: (x: 0, y: 0, z: 1))
             .animation(
                 Animation.linear(duration: 4)
             )
             .onAppear {
                 self.rotation2 += 360
                 withAnimation(.linear(duration: 4)) {
                                 self.position = CGSize(width: 0, height: 0)
                                 self.Scale = 0
                 }
             }
             .onDisappear(){
                 self.position = getCoords()
                 self.show.toggle()
             }
    }

    }
}
struct Ball_Previews: PreviewProvider {
    static var previews: some View {
        Ball()
    }
}

// pomocnicza funkcja generująca "przypadkowe" koordyanty poza oknem
func getCoords() -> CGSize {
    switch Int.random(in: 0...4) {
    case 0: return CGSize(width: Int.random(in: -400...400), height: -400)
    case 1: return CGSize(width: 400, height: Int.random(in: -400...400))
    case 2: return CGSize(width: Int.random(in: -400...400), height: 400)
    case 3: return CGSize(width: -400, height: Int.random(in: -400...400))
    default: return CGSize(width: 400, height: 400)
    }
}
func zmiany(change: Bool){
let theTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){
    _ in
    //change.toggle()
}
theTimer.fire()
}
