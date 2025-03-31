//
//  menu_aplicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/31/25.
//

import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.systemPink.withAlphaComponent(0.2)
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some View {
        TabView{
            GeneralPublicaciones()
                .tabItem{
                    Label("Publicaciones", systemImage:
                    "square.grid.2x2.fill")
                }
                .badge(controlador.publicaciones.count)
            
            
            Text("Explorar")
                .tabItem{
                    Label("Explorar", systemImage: "magnifyingglass")
                    /*}icon: {
                        Circle()
                            .frame(width:44, height: 44,
                                   alignment: .center)
                            .overlay(Text("33 Abraham"))
                    }*/
                }
            
            Text("Perfil")
                .tabItem{
                    Label("Perfil", systemImage:
                    "person.crop.circle")
                }
                .badge(controlador.publicaciones.count)
        }.accentColor(.pink)
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
