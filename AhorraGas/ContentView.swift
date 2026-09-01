//
//  ContentView.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 24/05/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PriceListView(stations: Station.samples, fuelType: .gasoleoA)
    }
}

#Preview {
    ContentView()
}
