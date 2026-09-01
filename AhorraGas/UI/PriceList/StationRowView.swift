//
//  StationRowView.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 01/09/2026.
//

import SwiftUI

struct StationRowView: View {
    let station: Station
    let fuelType: FuelType
    let priceLevel: PriceLevel
    
    var body: some View {
        
        HStack{
            VStack(alignment: .leading) {
                Text(station.brand)
                    .fontWeight(.bold)
                Text("\(station.address), \(station.municipality)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            if let precio = station.price(for: fuelType) {
                Text(precio.asFuelPrice)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(priceLevel.colorName))
            } else {
                Text("N/D")              // no lo vende
            }
        }
        .padding(12)
        .background(Color(.systemGroupedBackground))
        .overlay(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(priceLevel.colorName))
                .frame(width: 5)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.1), radius: 3, y: 1)
    }
}


#Preview {
    VStack{
        StationRowView(station: Station(id: 1, brand: "Repsol", address: "Calle Falsa", municipality: "Madrid", latitude: 40.0 , longitude: -3.0, prices: [.gasoleoA: 1.509]), fuelType: .gasoleoA, priceLevel: .cheap)
        StationRowView(station: Station(id: 1, brand: "Repsol", address: "Calle Falsa", municipality: "Madrid", latitude: 40.0 , longitude: -3.0, prices: [.gasoleoA: 1.509]), fuelType: .gasoleoA, priceLevel: .cheap)
        StationRowView(station: Station(id: 1, brand: "Repsol", address: "Calle Falsa", municipality: "Madrid", latitude: 40.0 , longitude: -3.0, prices: [.gasoleoA: 1.509]), fuelType: .gasoleoA, priceLevel: .cheap)
    }
    .padding()
}
