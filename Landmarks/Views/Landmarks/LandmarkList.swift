//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Douglas Cresswell on 24/03/2023.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    @StateObject private var modelData = ModelData()
    
    static var previews: some View {
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", "iPad Pro (12.9 inch) (2nd generation)"], id: \.self) { deviceName in
            LandmarkList()
            .environmentObject(ModelData())
//            .previewDevice(PreviewDevice(rawValue: deviceName))
//            .previewDisplayName(deviceName)
//
//        }
    }
}
