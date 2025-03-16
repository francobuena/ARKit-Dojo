//
//  ContentView.swift
//  ARKit_Dojo_Short
//
//  Created by Buena, Franco on 19/2/2024.
//

import SwiftUI
import RealityKit
import ARKit
import Combine

struct ContentView : View {
    @State private var isPlacementEnabled = false
    @State private var selectedModel: String?
    @State private var modelConfirmedForPlacement: String?
    
    private var models: [String] = getModelFilenames() ?? []
    
    var body: some View {
        ARViewContainer(modelConfirmedForPlacement: $modelConfirmedForPlacement).edgesIgnoringSafeArea(.all)
        
        if self.isPlacementEnabled {
            PlaceButtonsView(isPlacementEnabled: $isPlacementEnabled, 
                             selectedModel: $selectedModel,
                             modelConfirmedForPlacement: $modelConfirmedForPlacement)
        } else {
            ModelPickerView(isPlacementEnabled: $isPlacementEnabled, 
                            selectedModel: $selectedModel,
                            models: models)
        }
    }
}

#Preview {
    ContentView()
}
