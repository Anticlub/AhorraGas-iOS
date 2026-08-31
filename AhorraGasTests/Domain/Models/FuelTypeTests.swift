//
//  FuelTypeTests.swift
//  AhorraGasTests
//
//  Created by cristofer fernandez on 31/08/2026.
//

import Testing
@testable import AhorraGas

struct FuelTypeTests {

    @Test("fromPrecioilId devuelve el combustible correcto para un id conocido")
    func fromPrecioilIdConIdConocido() {
        #expect(FuelType.fromPrecioilId(6) == .gasoleoA)
    }

    @Test("fromPrecioilId devuelve nil para un id desconocido")
    func fromPrecioilIdDesconocido() {
        #expect(FuelType.fromPrecioilId(999) == nil)
    }
    
    @Test("fromPrecioilId es el inverso de precioilId", arguments: FuelType.allCases)
    func roundTrip(fuel: FuelType) {
        #expect(FuelType.fromPrecioilId(fuel.precioilId) == fuel)
    }
    
    @Test("electric.apiKey devuelve un string vacío")
    func electricApiKeyDevuelveStringVacio() {
        #expect(FuelType.electric.apiKey == "")
    }
}
