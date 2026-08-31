//
//  Vehicle.swift
//  AhorraGas
//
//  Created by cristofer fernandez on 24/05/2026.
//

struct Vehicle {

    // 2. Nombre que el usuario le da a su vehículo.
    //    Ejemplo: "Mi Coche", "Furgoneta del trabajo".
    let name: String

    // 3. Tipo de combustible que usa el vehículo.
    //    Determina qué precio se muestra por defecto en todas las pantallas.
    let fuelType: FuelType

    // 4. Consumo medio del vehículo en litros cada 100 km.
    //    Se usa para calcular el coste estimado de un trayecto.
    //    Ejemplo: 6.5 → el coche consume 6.5L cada 100 km.
    let consumptionPer100km: Double?

    // 5. Capacidad del depósito en litros.
    //    Se usa para calcular el coste de llenar el depósito completo.
    //    nil si el usuario no lo ha configurado.
    let tankCapacity: Double?

    // 6. Potencia máxima de carga en kW. Solo relevante para vehículos eléctricos.
    //    Se usa para filtrar electrolineras compatibles con el vehículo.
    //    nil para vehículos de combustión.
    let maxChargingPowerKw: Double?
}
