//
//  Station+Samples.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 01/09/2026.
//

import Foundation

extension Station {
    /// Estaciones de ejemplo para previews y desarrollo. Temporal:
    /// se sustituirá por datos reales cuando exista la capa de datos.
    static let samples: [Station] = [
        Station(id: 1, brand: "Repsol", address: "Calle A", municipality: "Madrid", latitude: 40, longitude: -3, prices: [.gasoleoA: 1.509]),
        Station(id: 2, brand: "Cepsa",  address: "Calle B", municipality: "Madrid", latitude: 40, longitude: -3, prices: [.gasoleoA: 1.629]),
        Station(id: 3, brand: "Shell",  address: "Calle C", municipality: "Madrid", latitude: 40, longitude: -3, prices: [.gasoleoA: 1.697])
    ]
}
