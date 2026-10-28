//
//  PriceRangeTests.swift
//  AhorraGasTests
//
//  Created by cristofer fernandez on 01/09/2026.
//

import Testing
@testable import AhorraGas

struct PriceRangeTests {
    
    private func station(gasoleoA: Double?) -> Station {
        let prices: [FuelType: Double] = gasoleoA.map { [.gasoleoA: $0]} ?? [:]
        return Station(id: 1, brand: "Repsol", address: "Calle Falsa", municipality: "Madrid", latitude: 40.0, longitude: -3.0, prices: prices)
    }
    
    @Test("PriceRange isEmpty es true si min y max son nulos y count es 0")
    func isEmptyisTrueConMinYMaxNilYCountEsCero() {
        #expect(PriceRange(min: nil, max: nil, count: 0).isEmpty == true )
    }
    
    @Test("PriceRange isEmpty es true si min y max tienen valor y count es 0")
    func isEmptyisTrueConMinYMaxYCountEsCero() {
        #expect(PriceRange(min: 1.4, max: 1.4, count: 0).isEmpty == true)
    }
    
    @Test("PriceRange isEmpty es false si min y max tienen valores correctos y count es positivo")
    func isEmptyisFalseMinYMaxConValoresCorrectosYCountEsPositivo() {
        #expect(PriceRange(min: 1.4, max: 1, count: 5).isEmpty == false)
    }
    
    @Test("PriceRange isFlat es true si min y max son el mismo valor")
    func isFlat() {
        #expect(PriceRange(min: 10, max: 10, count: 10).isFlat == true )
    }

    @Test("PriceRange isFlat es false si min y max son distintos valores")
    func isNotFlat() {
        #expect(PriceRange(min: 10, max: 20, count: 10).isFlat == false )
    }
    
    @Test("un rango sin datos útiles es isEmpty", arguments: [
        PriceRange(min: nil, max: 1.5, count: 5),
        PriceRange(min: 1.2, max: 1.5, count: 0)
    ])
    func rangosVaciosSonEmpty(rango: PriceRange) {
        #expect(rango.isEmpty)
    }
    
    @Test("Sin estaciones rango vacio")
    func sinEstacionesRangoIsEmpty() {
        let range = PriceRange.from(stations: [], fuelType: .gasolina95E5)
        #expect(range.isEmpty)
    }

    @Test("from calcula min, max y count con precios")
    func fromCalculaRangoConPrecios() {
        let estaciones = [station(gasoleoA: 1.5), station(gasoleoA: 1.7), station(gasoleoA: 1.6)]
        let range = PriceRange.from(stations: estaciones, fuelType: .gasoleoA)
        #expect(range.min == 1.5)
        #expect(range.max == 1.7)
        #expect(range.count == 3)
    }

    @Test("from excluye estaciones que no venden ese combustible")
    func fromExcluyeEstacionesSinEseCombustible() {
        let estaciones = [station(gasoleoA: 1.5), station(gasoleoA: nil), station(gasoleoA: 1.7)]
        let range = PriceRange.from(stations: estaciones, fuelType: .gasoleoA)
        #expect(range.count == 2)
        #expect(range.min == 1.5)
        #expect(range.max == 1.7)
    }
}

