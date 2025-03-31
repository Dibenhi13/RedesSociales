//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI
 
struct GeneralPublicaciones: View {
    // @StateObject var controlador = ControladorPublicaciones() //guardamos la informacion quequeremos guardar
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 15){
                    ForEach(controlador.publicaciones){ publicacion in
                        NavigationLink{
                            PublicacionVista()
                        }label:{
                            HStack(alignment: .top, spacing: 15){
                             
                                Circle()
                                    .fill(Color.pink.opacity(0.7))
                                    .frame(width: 50, height: 50)
                                    .overlay(Text("\(publicacion.id)").foregroundColor(.white))
                               
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(publicacion.title)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    Text(publicacion.body)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .lineLimit(3)
                                }
                                .padding(.vertical, 10)
                                Spacer()
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 3)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            controlador.seleccionar_publicacion(publicacion)
                        })
                    }
                }
                .padding()
            }
            .background(Color.pink.opacity(0.2))
            .onAppear {
                print("Hi world")
            }
        }
    }
 }

#Preview {
    GeneralPublicaciones()
        .environment(ControladorAplicacion())
}

/*//
 //  publicaciones_general.swift
 //  RedesSociales
 //
 //  Created by alumno on 3/24/25.
 //
  
 import SwiftUI
 struct GeneralPublicaciones: View {
     // @StateObject var controlador = ControladorPublicaciones() //guardamos la informacion quequeremos guardar
     @Environment(ControladorAplicacion.self) var controlador
     var body: some View {
         NavigationStack{
             ScrollView{
                 VStack{
                     ForEach(controlador.publicaciones){ publicacion in
                         NavigationLink{
                             PublicacionVista()
                         }label:{
                             HStack{
                                 Text("\(publicacion.id)")
                                 VStack{
                                     Text("\(publicacion.title)")
                                     Text("\(publicacion.body)")
                                 }
                             }
                         }.simultaneousGesture(TapGesture().onEnded({
                             controlador.seleccionar_publicacion(publicacion)
                         }))
                     }
                 }
             }
             .onAppear{
                 print("Hi world")
             }
         }
     }
 }
  
 #Preview {
     GeneralPublicaciones()
         .environment(ControladorAplicacion())
 }*/

