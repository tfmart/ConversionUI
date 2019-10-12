//
//  ContentView.swift
//  ConvertorUI
//
//  Created by Tomas Martins on 11/10/19.
//  Copyright © 2019 Tomas Martins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ConverterView(method: .temperature)
                .tabItem {
                    Image(systemName: "thermometer")
                    Text("Temperature")
                }.tag(0)
            ConverterView(method: .lenght)
                .tabItem {
                    Image(systemName: "slash.circle")
                    Text("Lenght")
                }.tag(1)
            ConverterView(method: .time)
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("Time")
                }.tag(2)
            ConverterView(method: .volume)
                .tabItem {
                    Image(systemName: "cube")
                    Text("Volume")
                }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
