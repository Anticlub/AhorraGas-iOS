//
//  PriceAlert.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 24/05/2026.
//

import Foundation

// 1. Representa una alerta de precio que el usuario ha configurado
//    para una estación favorita y un combustible concreto.
//    Se persiste en Firestore bajo /users/{uid}/alerts/{id}.
struct PriceAlert: Identifiable {

    // 2. Identificador único construido como "\(stationId)_\(fuelType.rawValue)".
    //    Ejemplo: "1234_gasoleoA".
    //    Evita duplicados: no puede haber dos alertas para la misma
    //    estación y combustible.
    let id: String

    // 3. ID numérico de la estación a la que aplica la alerta.
    //    Coincide con el campo id de Station y con la clave en Firestore.
    let stationId: Int

    // 4. Nombre visible de la estación (marca + municipio).
    //    Se guarda aquí para mostrarlo en la lista de alertas sin necesidad
    //    de consultar Firestore cada vez.
    let stationName: String

    // 5. Combustible al que aplica la alerta.
    let fuelType: FuelType

    // 6. Precio umbral en €/L. La Cloud Function dispara la notificación
    //    cuando el precio actual es menor o igual a este valor.
    let targetPrice: Double

    // 7. Fecha de la última notificación enviada.
    //    nil si nunca se ha notificado.
    //    La Cloud Function respeta un cooldown de 24h entre notificaciones
    //    para no saturar al usuario.
    var lastNotifiedAt: Date?
}
