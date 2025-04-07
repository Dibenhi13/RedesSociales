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
        TabView{
            GeneralPublicaciones()
                .tabItem { Label("Cuentas y tal", systemImage: "Circle") }
                .badge(controlador.publicaciones.count)
            PantallaPersonaje()
                .tabItem { Label("Dragon Ball DB", systemImage: "Circle") }
            Text("Hola desde pantalla 3")
                .tabItem {
                    Label{
                        VStack{
                            Text("Pantallita 3")
                                //.//font(.custom("BungeeTint-Regular", size: 34))
                        }
                    } icon: {
                        Circle()
                            .frame(width: 44, height: 44, alignment: .center)
                            .overlay(Text("Holaaa"))
                    }
                }
        }
    }
}
#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}




/*
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
*/

/*//
 //  menu_aplicacion.swift
 //  RedesSociales
 //
 //  Created by alumno on 3/31/25.
 //
  
 import SwiftUI
  
 struct MenuNavegacion: View {
     @Environment(ControladorAplicacion.self) var controlador
     var body: some View {
         TabView{
             GeneralPublicaciones()
                 .tabItem{
                     Label("En esta pantalla", systemImage:
                     "circle")
                 }
                 .badge(controlador.publicaciones.count)

             Text("You look like you were ai generated")
                 .tabItem{
                     Label{
                         Text("Es neta pantalla")
                         Text("Es neta pantalla")
                     }icon: {
                         Circle()
                             .frame(width:44, height: 44,
                                    alignment: .center)
                             .overlay(Text("33 Abraham"))
                     }
                 }
             Text("Hellooo")
                 .tabItem{
                     Label("En esta pantalla", systemImage:
                     "circle")
                 }
                 .badge(controlador.publicaciones.count)
         }
     }
 }
  
 #Preview {
     MenuNavegacion()
         .environment(ControladorAplicacion())
 }*/


/*import SwiftUI
 
 struct MenuNavegacion: View {
     @EnvironmentObject var controlador: ControladorAplicacion  // Use @EnvironmentObject instead of @Environment for shared data
     
     init() {
         UITabBar.appearance().backgroundColor = UIColor.systemPink.withAlphaComponent(0.2)
         UITabBar.appearance().unselectedItemTintColor = UIColor.gray
     }
     
     var body: some View {
         TabView {
             GeneralPublicaciones()
                 .tabItem {
                     Label("Publicaciones", systemImage: "square.grid.2x2.fill")
                 }
                 .badge(controlador.publicaciones.count)
             
             Text("Explorar")
                 .tabItem {
                     Label("Explorar", systemImage: "magnifyingglass")
                 }
                 .overlay(
                     VStack {
                         Text("Dragon Ball DB")
                             .font(.caption)
                             .foregroundColor(.gray)
                     }, alignment: .bottom
                 )
             
             Text("Perfil")
                 .tabItem {
                     Label("Perfil", systemImage: "person.crop.circle")
                 }
                 .badge(controlador.publicaciones.count)
         }
         .accentColor(.pink)
     }
 }

 #Preview {
     MenuNavegacion()
         .environmentObject(ControladorAplicacion())  // Make sure to use environmentObject in the preview
 }
*/
