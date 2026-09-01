//
//  MainTabView.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 01/09/2026.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Mapa", systemImage: "map") {
                ContentUnavailableView("Mapa", systemImage: "map", description: Text("Próximamente"))
            }
            Tab("Por precio", systemImage: "eurosign") {
                PriceListView(stations: Station.samples, fuelType: .gasoleoA)
            }
            Tab("Por distancia", systemImage: "location") {
                ContentUnavailableView("Por distancia", systemImage: "location", description: Text("Próximamente"))
            }
            Tab("Favoritas", systemImage: "heart") {
                ContentUnavailableView("Favoritas", systemImage: "heart", description: Text("Próximamente"))
            }
            Tab("Preferencias", systemImage: "gearshape") {
                ContentUnavailableView("Preferencias", systemImage: "gearshape", description: Text("Próximamente"))
            }
        }
    }
}

#Preview {
    MainTabView()
}
