//
//  Double+FuelPrice.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 01/09/2026.
//

import Foundation

extension Double {
    /// El precio de un carburante formateado(EUR, 3 decimales, según el idioma).
    var asFuelPrice: String {
        formatted(.currency(code: "EUR").precision(.fractionLength(3)))
    }
}
