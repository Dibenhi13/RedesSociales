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
import SwiftUI

struct PantallaPersonaje: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        NavigationStack {
            if let resultados = controlador.pagina_resultados {
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(resultados.items) { personaje in
                            NavigationLink {
                                PersonajeVista()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.brown)
                                        .shadow(radius: 5)
                                    HStack(spacing: 16) {
                                        AsyncImage(url: URL(string: personaje.image)) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                        } placeholder: {
                                            Color.gray.opacity(0.2)
                                        }
                                        .frame(width: 80, height: 120)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(personaje.name)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            Text(personaje.race)
                                                .font(.subheadline)
                                                .foregroundColor(.white.opacity(0.8))
                                        }
                                        Spacer()
                                    }
                                    .padding()
                                }
                                .padding(.horizontal)
                            }
                            .simultaneousGesture(
                                TapGesture().onEnded {
                                    controlador.descargar_informacion_personaje(id: personaje.id)
                                }
                            )
                        }
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Lista de Personajes")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    PantallaPersonaje()
        .environment(ControladorAplicacion())

}

/* var body: some View {
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
*/
