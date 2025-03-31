//
//  publicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/26/25.
//

import SwiftUI

let publicacion_false = Publicacion(userId: 1, id: 1, title: "Lorem", body: "Et dolor")

struct PublicacionVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Tarjeta de la publicación
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(radius: 5)
                .padding()
                .overlay(
                    VStack(alignment: .leading, spacing: 10) {
                        Text(controlador.publicacion_seleccionada?.title ?? "Título no disponible")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text(controlador.publicacion_seleccionada?.body ?? "Contenido no disponible")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .padding()
                )
            // Botón para ver perfil
            NavigationLink {
                PerfilBasicoVista()
            } label: {
                Text("Ver perfil")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.pink)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .simultaneousGesture(TapGesture().onEnded({
                controlador.ver_perfil(id: controlador.publicacion_seleccionada?.userId ?? 0)
            }))
            // Sección de comentarios
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(controlador.comentarios) { comentario in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(comentario.name)
                                .font(.headline)
                                .foregroundColor(.black)
                            Text(comentario.body)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.pink.opacity(0.2))
    }
 }
 #Preview {
    NavigationStack {
        PublicacionVista()
            .environment(ControladorAplicacion())
    }
 }
