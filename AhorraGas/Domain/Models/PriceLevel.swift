//
//  PriceLevel.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 24/05/2026.
//

import Foundation

// 1. Representa el nivel de precio de una gasolinera respecto al resto
//    del conjunto visible. Se usa para pintar el color del indicador
//    en la lista y en el mapa (verde / amarillo / rojo / gris).
enum PriceLevel {

    case cheap      // precio en el tercio inferior del rango → verde
    case mid        // precio en el tercio medio del rango → amarillo
    case expensive  // precio en el tercio superior del rango → rojo
    case unknown    // sin precio disponible o rango vacío → gris

    // 2. Color asociado a cada nivel.
    //    Devuelve un nombre de asset de Assets.xcassets, lo que permite
    //    cambiar los colores sin tocar código (modo oscuro incluido).
    var colorName: String {
        switch self {
        case .cheap:     return "priceGreen"
        case .mid:       return "priceYellow"
        case .expensive: return "priceRed"
        case .unknown:   return "priceGray"
        }
    }
}
