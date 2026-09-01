//
//  PriceListView.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 01/09/2026.
//

import SwiftUI

struct PriceListView: View {
    let stations: [Station]
    let fuelType: FuelType
    
    var body: some View {
        List(stations) { station in
            StationRowView(station: station, fuelType: fuelType, priceLevel: .cheap)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
    }
}

#Preview {
    PriceListView(stations: Station.samples, fuelType: .gasoleoA)
}
