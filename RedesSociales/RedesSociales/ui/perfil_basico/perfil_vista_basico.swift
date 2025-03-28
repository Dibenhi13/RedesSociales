//
//  perfil_vista_basico.swift
//  RedesSociales
//
//  Created by alumno on 3/28/25.
//

import SwiftUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Valor por defecto")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Valor por defecto")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "Valor por defecto")")
            .onDisappear(){
                print("Adios, solo sale este mensaje cuando destruimos la vista")
            }
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
