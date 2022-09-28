//
//  ContentView.swift
//  MapKit1
//
//  Created by Vincenzo Caruso on 28/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapViewManual()
                .edgesIgnoringSafeArea(.all)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
