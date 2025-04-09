//
//  personaje_vista.swift
//  RedesSociales
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

struct PersonajeVista: View {
@Environment(ControladorAplicacion.self) var controlador

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                if let personaje = controlador.personaje {
                    AsyncImage(url: URL(string: personaje.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(16)

                    } placeholder: {
                        Color.gray.opacity(0.2)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()

                    Text("Nombre: \(personaje.name)")
                    Text("Ki: \(personaje.ki)")
                    Text("Max Ki: \(personaje.maxKi)")
                    Text("Raza: \(personaje.race)")
                    Text("Género: \(personaje.gender)")
                    Text("Descripción: \(personaje.description)")
                    Text("Afiliación: \(personaje.affiliation)")
                    //Text("Planeta de origen: \(personaje.originPlanet)")
                    Text("Transformaciones: \(personaje.transformations?.count ?? 0)")
                } else {
                    Text("Cargando personaje...")
                }
            }
            .font(.body)
            .padding()
            .background(Color("FondoClaro"))
        }
    }
}


#Preview {
    PersonajeVista()
}




/*
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
                     Text(controlador.pagina_resultados?.name ?? "Usuario")
                         .font(.title2)
                         .fontWeight(.bold)
                         .foregroundColor(.black)
                     Text(controlador.pagina_resultados?.name ?? "Nombre completo")
                         .font(.headline)
                         .foregroundColor(.gray)
                     Text(controlador.pagina_resultados?.name ?? "correo@ejemplo.com")
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
 */
