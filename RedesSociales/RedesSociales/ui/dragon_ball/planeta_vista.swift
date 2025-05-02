//
//  planeta_vista.swift
//  RedesSociales
//
//  Created by alumno on 5/2/25.
//

import SwiftUI

struct PlanetaVista: View {
@Environment(ControladorAplicacion.self) var controlador

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let planeta = controlador.planeta {
                    AsyncImage(url: URL(string: planeta.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(20)

                    } placeholder: {
                        Color.gray.opacity(0.2)
                            .frame(height: 200)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal)
                    
                    infoItem(label: "Nombre", value: planeta.name)
                    infoItem(label: "Destruido", value: planeta.isDestroyed ? "Sí, destruido" : "No destruido")
                    infoItem(label: "Descripción", value: planeta.description)
                
                    
                }
            }.padding()
        }
        .navigationTitle("Perfil del Planeta")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.pink.opacity(0.2))
    }
    
    func infoItem(label: String, value: String) -> some View{
        VStack(alignment: .leading, spacing: 4){
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.body)
                .foregroundColor(.black)
                .padding(.bottom, 8)
            Divider().background(Color.gray.opacity(0.3))
        }
        .padding(.horizontal)
    }
}


#Preview {
    PlanetaVista()
}
