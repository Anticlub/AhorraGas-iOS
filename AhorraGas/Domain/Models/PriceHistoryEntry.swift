//
//  PriceHistoryEntry.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 24/05/2026.
//

import Foundation

// 1. Representa un registro histórico del precio de un combustible
//    en una estación concreta en un momento dado.
//    Los datos vienen de la API de Precioil, no de Firestore.
struct PriceHistoryEntry: Identifiable {

    // 2. Identificador único del registro.
    //    Se construye como "\(stationId)_\(fuelType.rawValue)_\(recordedAt)"
    let id: String

    // 3. Tipo de combustible al que corresponde este registro.
    let fuelType: FuelType

    // 4. Precio en €/L registrado en ese momento.
    let price: Double

    // 5. Fecha y hora en la que se registró el precio según Precioil.
    let recordedAt: Date
}
