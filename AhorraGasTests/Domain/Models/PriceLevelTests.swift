//
//  PriceLevelTests.swift
//  AhorraGasTests
//
//  Created by cristofer fernandez on 01/09/2026.
//

import Testing
@testable import AhorraGas

struct PriceLevelTests {

    // Rango de referencia: min 1.0, max 1.75, count 3.
    // Se elige a propósito para que el tercio sea 0.25 (exacto en binario)
    // y las fronteras caigan en 1.25 y 1.5, exactas → sin líos de coma flotante.
    private let range = PriceRange(min: 1.0, max: 1.75, count: 3)

    // MARK: - Casos especiales

    @Test("precio nil → unknown")
    func precioNilEsUnknown() {
        #expect(PriceLevel.level(for: nil, in: range) == .unknown)
    }

    @Test("rango vacío → unknown")
    func rangoVacioEsUnknown() {
        let vacio = PriceRange(min: nil, max: nil, count: 0)
        #expect(PriceLevel.level(for: 1.5, in: vacio) == .unknown)
    }

    @Test("rango plano (min == max) → mid")
    func rangoPlanoEsMid() {
        let plano = PriceRange(min: 1.5, max: 1.5, count: 2)
        #expect(PriceLevel.level(for: 1.5, in: plano) == .mid)
    }

    // MARK: - Tercios (incluye min, max y las dos fronteras)

    @Test("nivel según el tercio del rango", arguments: [
        (1.0, PriceLevel.cheap),       // min → barato
        (1.1, PriceLevel.cheap),       // tercio inferior
        (1.25, PriceLevel.mid),        // frontera inferior (min+tercio) → medio
        (1.4, PriceLevel.mid),         // tercio medio
        (1.5, PriceLevel.expensive),   // frontera superior (min+2·tercio) → caro
        (1.6, PriceLevel.expensive),   // tercio superior
        (1.75, PriceLevel.expensive)   // max → caro
    ])
    func nivelSegunTercio(price: Double, esperado: PriceLevel) {
        #expect(PriceLevel.level(for: price, in: range) == esperado)
    }
}
