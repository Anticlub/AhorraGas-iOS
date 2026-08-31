//
//  Station.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 31/08/2026.
//

import Foundation

// Estación de servicio. Modelo de dominio limpio e inmutable;
// el parseo del JSON del Ministerio se hará en la capa de datos.
struct Station: Identifiable {
    let id: Int
    let brand: String
    let address: String
    let municipality: String
    let latitude: Double
    let longitude: Double
    let prices: [FuelType: Double]
    
    /// Devuelve el precio de un combustible concreto, o nil si la estación no lo vende.
    func price(for fuel: FuelType) -> Double? {
        prices[fuel]
    }
}
