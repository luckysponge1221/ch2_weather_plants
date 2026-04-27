//
//  ContentView.swift
//  ch2_weather_plants
//
//  Created by Mutia Rahman  on 18/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            TabView {
                FirstScreen()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                
                SecondScreen()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                
                
                }
            
            
            .tint(Color.graccentcolor)
            }
        }
        
    }

#Preview {
    ContentView()
}
