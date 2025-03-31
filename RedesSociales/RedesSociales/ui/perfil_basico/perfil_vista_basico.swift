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
        VStack(spacing: 20) {
            // Avatar
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .background(Circle().fill(Color.pink.opacity(0.7)))
                .padding(.top, 20)
            
            // Tarjeta de información
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 5)
                .frame(width: 300, height: 150)
                .overlay(
                    VStack(spacing: 10) {
                        Text(controlador.perfil_a_mostrar?.username ?? "Usuario")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text(controlador.perfil_a_mostrar?.name ?? "Nombre completo")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text(controlador.perfil_a_mostrar?.email ?? "correo@ejemplo.com")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                )
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.pink.opacity(0.2))
        .onDisappear {
            print("Adios, solo sale este mensaje cuando destruimos la vista")
        }
    }
 }
 #Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
 }



