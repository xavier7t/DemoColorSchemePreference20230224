//
//  ContentView.swift
//  DemoColorSchemePreference20230224
//
//  Created by Xavier on 2/24/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("colorScheme") var selectedColorScheme: String = "system"
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Picker(selection: $selectedColorScheme, label: Text("Color Scheme")) {
                        Text("System").tag("system")
                        Text("Light").tag("light")
                        Text("Dark").tag("dark")
                    }
                    .pickerStyle(.segmented)
                    .preferredColorScheme(getPreferredColorScheme())
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    private func getPreferredColorScheme() -> ColorScheme? {
        switch selectedColorScheme {
        case "light":
            return .light
        case "dark":
            return .dark
        default:
            return nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
