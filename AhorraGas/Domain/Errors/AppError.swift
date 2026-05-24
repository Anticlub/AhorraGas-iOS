//
//  AppError.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 24/05/2026.
//

import Foundation

/// 1. Declara el enum como Error y LocalizedError.
//    - Error: permite usarlo con throw/catch
//    - LocalizedError: permite que iOS muestre el mensaje automáticamente
enum AppError: Error, LocalizedError {

    // 2. Casos posibles. Algunos llevan dato asociado (underlying, detail)
    //    para poder propagar el error original sin perder información.
    case network(underlying: Error)       // fallo de red (sin conexión, DNS, etc.)
    case timeout                          // el servidor tardó demasiado
    case emptyResponse                    // respuesta HTTP vacía
    case parseFailure(String)             // error al parsear JSON, con detalle
    case firestoreError(underlying: Error)// error del SDK de Firestore
    case locationUnavailable              // GPS no disponible o denegado
    case unknown                          // cualquier otro error no tipado

    // 3. Propiedad requerida por LocalizedError.
    //    iOS la llama automáticamente cuando necesita mostrar el error al usuario.
    var errorDescription: String? {
        switch self {
        case .network(let error):
            // %@ se sustituye por error.localizedDescription en tiempo de ejecución
            return String(
                format: NSLocalizedString("error.network", comment: ""),
                error.localizedDescription
            )
        case .timeout:
            return NSLocalizedString("error.timeout", comment: "")
        case .emptyResponse:
            return NSLocalizedString("error.empty_response", comment: "")
        case .parseFailure(let detail):
            return String(
                format: NSLocalizedString("error.parse_failure", comment: ""),
                detail
            )
        case .firestoreError(let error):
            return String(
                format: NSLocalizedString("error.firestore", comment: ""),
                error.localizedDescription
            )
        case .locationUnavailable:
            return NSLocalizedString("error.location_unavailable", comment: "")
        case .unknown:
            return NSLocalizedString("error.unknown", comment: "")
        }
    }
}
