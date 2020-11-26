//
//  DuplaBotoes.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 26/11/20.
//

import SwiftUI

struct DuplaBotoes: View {
    
    enum EstadosBotoes {
        case deselect
        case posso
        case vai
    }
    
    @State var estado: EstadosBotoes = .deselect
    
    var possoCount: Int = 0 // pegou por API, CoreData, sei lá
    
    var exibirPossoCount: Int {
        if estado == .posso {
            return 1 + possoCount
        }
        else {
            return possoCount
        }
    }
    
    var vaiCount: Int = 0
    
    var exibirVaiCount: Int {
        if estado == .vai {
            return 1 + vaiCount
        }
        else {
            return vaiCount
        }
    }
    
    func tentarMudar(para: EstadosBotoes){
        if estado == .deselect {
            estado = para
        } else if estado == para {
            estado = .deselect
        }
    }
    
    var possoAjudarButton: some View {
        Button(action: {
            tentarMudar(para: .posso)
        }) {
            Text("Posso ajudar! (\(exibirPossoCount))")
        }
        .buttonStyle(SelectableButtonStyle(isSelected: estado == .posso, tint: Color("Roxo")))
    }
    
    var vaiDarCertoButton: some View {
        Button(action: {
            tentarMudar(para: .vai)
        }) {
            Text("Vai dar certo! (\(exibirVaiCount))")
        }
        .buttonStyle(SelectableButtonStyle(isSelected: estado == .vai, tint: Color("Laranja")))
    }
    
    var body: some View {
        HStack {
            possoAjudarButton
            
            vaiDarCertoButton
        }
    }
}

struct SelectableButtonStyle: ButtonStyle {
    var isSelected: Bool
    var tint: Color
    var foreGroundColor: Color {
        if isSelected { return .white }
        else { return tint }
    }
    
    var bgColor: Color {
        if isSelected { return tint }
        else { return .clear }
    }
    
    var borderColor: Color {
        if isSelected { return .clear }
        else { return tint}
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 120, height: 13, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .font(.system(size:14, weight: .bold))
            .padding()
            .foregroundColor(foreGroundColor)
            .background(bgColor)
            .border(borderColor, width: 2)
            .cornerRadius(5)
    }
}

