//
//  Navigation.swift
//  GreenRoute
//
//  Created by Longde Lao on 22.04.23.
//

import SwiftUI

struct Navigation: View {
    @State private var fullscreen = false
    var body: some View {
        MapView()
            .animation(.easeInOut(duration: 0.4))
            .frame(width: fullscreen ? 440:420 , height: fullscreen ? 1000: 200)
            .onTapGesture {
                fullscreen = true
            }
          
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
     ContentView()
    }
}
