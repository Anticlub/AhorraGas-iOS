//
//  FuelType.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 24/05/2026.
//

import Foundation

// 1. CaseIterable permite iterar todos los casos (útil para pickers y filtros)
// 2. String rawValue se usa como clave en Firestore y UserDefaults
enum FuelType: String, CaseIterable {

    // 3. Cada caso representa un tipo de combustible.
    //    El rawValue coincide con la clave que guardaremos en Firestore.
    case gasolina95E5
    case gasolina95E5Premium
    case gasolina98E5
    case gasoleoA
    case gasoleoPremium
    case gasoleoB
    case gasoleoC
    case biodiesel
    case bioetanol
    case glp
    case gnc
    case electric

    // 4. Clave exacta que usa la API del Ministerio en su JSON.
    //    La Cloud Function usa esto para parsear y escribir en Firestore.
    var apiKey: String {
        switch self {
        case .gasolina95E5:         return "Precio Gasolina 95 E5"
        case .gasolina95E5Premium:  return "Precio Gasolina 95 E5 Premium"
        case .gasolina98E5:         return "Precio Gasolina 98 E5"
        case .gasoleoA:             return "Precio Gasoleo A"
        case .gasoleoPremium:       return "Precio Gasoleo Premium"
        case .gasoleoB:             return "Precio Gasoleo B"
        case .gasoleoC:             return "Precio Gasoleo C"
        case .biodiesel:            return "Precio Biodiesel"
        case .bioetanol:            return "Precio Bioetanol"
        case .glp:                  return "Precio Gases licuados del petróleo"
        case .gnc:                  return "Precio Gas Natural Comprimido"
        case .electric:             return ""
        }
    }

    // 5. Nombre visible en la UI. Se localiza desde el String Catalog.
    var displayName: String {
        NSLocalizedString("fuel.\(rawValue)", comment: "")
    }

    // 6. ID numérico que usa la API de Precioil para el historial de precios.
    //    -1 para eléctrico porque no tiene historial de precios por litro.
    var precioilId: Int {
        switch self {
        case .gasolina95E5:         return 10
        case .gasolina95E5Premium:  return 11
        case .gasolina98E5:         return 13
        case .gasoleoA:             return 6
        case .gasoleoPremium:       return 8
        case .gasoleoB:             return 7
        case .gasoleoC:             return 15
        case .biodiesel:            return 1
        case .bioetanol:            return 2
        case .glp:                  return 5
        case .gnc:                  return 3
        case .electric:             return -1
        }
    }

    // 7. Inicializador seguro desde un ID de Precioil.
    //    Devuelve nil si el ID no corresponde a ningún caso conocido.
    static func fromPrecioilId(_ id: Int) -> FuelType? {
        allCases.first { $0.precioilId == id }
    }
}
