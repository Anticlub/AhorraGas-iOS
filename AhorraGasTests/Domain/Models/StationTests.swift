//
//  StationTests.swift
//  AhorraGasTests
//
//  Created by cristofer fernandez on 01/09/2026.
//

import Testing
@testable import AhorraGas

struct StationTests {
    private func makeStation(prices: [FuelType: Double] = [:]) -> Station {
        Station(
            id: 1,
            brand: "TEST",
            address: "Calle de la piruleta",
            municipality: "Madrid",
            latitude: 40.0,
            longitude: -3.0,
            prices: prices
        )
    }

    @Test("price(for:) devuelve el precio cuando la estación vende ese combustible")
    func priceDevuelveElPrecioSiSeVende() {
        let station = makeStation(prices: [.gasoleoA: 1.5])
        #expect(station.price(for: .gasoleoA) == 1.5)
    }
    
    @Test("price(for:) devuelve nil cuando la estación no vende ese combustible")
    func priceDevuelveNilSiNoSeVende() {
        let station = makeStation()
        #expect(station.price(for: .biodiesel) == nil)
    }

}
