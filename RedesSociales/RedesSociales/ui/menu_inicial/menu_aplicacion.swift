//
//  menu_aplicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/31/25.
//

//
//  menu_aplicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/31/25.
//

import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador

    var body: some View {
        TabView {
            GeneralPublicaciones()
                .tabItem { Label("Posts", systemImage: "bubble.left.circle.fill") }
                .badge(controlador.publicaciones.count)

            PantallaPersonaje()
                .tabItem { Label("Dragon Ball DB", systemImage: "star.circle.fill") }
            
            PantallaPlaneta()
                .tabItem { Label("Planetas", systemImage: "globe.americas.fill") }

            PerfilBasicoVista()
                .tabItem { Label("Perfil", systemImage: "person.crop.circle") }
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}



