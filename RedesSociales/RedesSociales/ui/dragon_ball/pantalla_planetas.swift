//
//  pantalla_planetas.swift
//  RedesSociales
//
//  Created by alumno on 5/2/25.
//

import SwiftUI
// Para que puedas cargar una imagen por default cuando descargues la imagen
/*
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-load-a-remote-image-from-a-url
 */
import SwiftUI

struct PantallaPlaneta: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        NavigationStack {
            if let resultados = controlador.pagina_resultados_planeta {
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(resultados.items) { planeta in
                            NavigationLink {
                                PlanetaVista()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .shadow(radius: 5)
                                    HStack(spacing: 16) {
                                        AsyncImage(url: URL(string: planeta.image)) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                        } placeholder: {
                                            Color.gray.opacity(0.2)
                                        }
                                        .frame(width: 120, height: 120)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(planeta.name)
                                                .font(.headline)
                                                .foregroundColor(.black)
                                            
                                        }
                                        Spacer()
                                    }
                                    .padding()
                                }
                                .padding(.horizontal)
                            }
                            .simultaneousGesture(
                                TapGesture().onEnded {
                                    controlador.descargar_informacion_planeta(id: planeta.id)
                                }
                            )
                        }
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Lista de Planetas")
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.pink.opacity(0.2))
            }
        }
    }
}

#Preview {
    PantallaPlaneta()
        .environment(ControladorAplicacion())

}
