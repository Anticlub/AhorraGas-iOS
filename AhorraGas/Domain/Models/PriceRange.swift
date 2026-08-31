//
//  PriceRange.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 24/05/2026.
//

// 1. Representa el rango de precios del conjunto de estaciones visible
//    en un momento dado. Se usa para calcular el PriceLevel de cada estación
//    (barata / media / cara) de forma relativa, no absoluta.
//
// ⚠️ CRÍTICO: el rango siempre se calcula con precios YA descontados.
//    Nunca usar precios brutos aquí, o los colores serán incorrectos.
struct PriceRange {

    // 2. Precio mínimo del conjunto. nil si no hay estaciones con precio.
    let min: Double?

    // 3. Precio máximo del conjunto. nil si no hay estaciones con precio.
    let max: Double?

    // 4. Número de estaciones que tienen precio válido para este combustible.
    let count: Int

    // 5. Devuelve true si el rango no tiene datos útiles.
    //    Un rango vacío hace que todas las estaciones muestren color gris.
    //
    //    Nota: `count` es un Int de dominio (nº de estaciones), no el `.count`
    //    de una colección; por eso desactivamos empty_count solo en esta línea.
    var isEmpty: Bool {
        // swiftlint:disable:next empty_count
        min == nil || max == nil || count == 0
    }

    // 6. Devuelve true si todas las estaciones tienen exactamente el mismo precio.
    //    En ese caso todas se consideran de nivel medio (amarillo).
    var isFlat: Bool {
        guard let min, let max else { return false }
        return min == max
    }
}
