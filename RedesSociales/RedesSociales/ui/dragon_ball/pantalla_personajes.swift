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
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
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
                                                .foregroundColor(.black)
                                            Text(personaje.race)
                                                .font(.subheadline)
                                                .foregroundColor(.gray.opacity(0.8))
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
                .background(Color.pink.opacity(0.2))
            }
        }
    }
}

#Preview {
    PantallaPersonaje()
        .environment(ControladorAplicacion())

}


