//
//  pantalla_personajes.swift
//  RedesSociales
//
//  Created by alumno on 4/4/25.
//

import SwiftUI
// Para que puedas cargar una imagen por default cuando descargues la imagen
/*
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-load-a-remote-image-from-a-url
 */
struct PantallaPersonaje: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            if(controlador.pagina_resultados != nil){
                ScrollView{
                    LazyVStack{
                        ForEach(controlador.pagina_resultados!.items){ personaje in
                            NavigationLink{
                               PersonajeVista()
                            }label:{
                                HStack{
                                    Text("El personaje es \(personaje.name)")
                                    VStack{
                                        AsyncImage(url: URL(string: personaje.image))
                                    }
                                }
                            }.simultaneousGesture(TapGesture().onEnded({
                                //controlador.publicacion_seleccionada(publicacion)
                            }))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaPersonaje()
        .environment(ControladorAplicacion())
}

