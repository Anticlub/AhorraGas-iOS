//
//  StationRowView.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 01/09/2026.
//

import SwiftUI

struct StationRowView: View {
    let station: Station
    
    var body: some View {
        Text(station.brand)
    }
}

#Preview {
    StationRowView(station: Station(id: 1, brand: "Repsol", address: "Calle Falsa", municipality: "Madrid", latitude: 40.0 , longitude: -3.0, prices: [.gasoleoA: 1.5]))
}
