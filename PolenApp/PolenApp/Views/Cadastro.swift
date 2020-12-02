//
//  Cadastro.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
import Firebase

struct Cadastro: View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    // @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    @EnvironmentObject var session: FirebaseSession
    
    var emailField: some View {
        TextField("Email", text: self.$email)
            .autocapitalization(.none)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
            .padding(.top, 25)
            .padding(.horizontal)
    }
    
    var passwordField: some View{
        HStack{
            if self.visible {
                TextField("Password", text: self.$pass)
                    .autocapitalization(.none)
                    .padding()
            }else{
                SecureField("Password", text: self.$pass)
                    .autocapitalization(.none)
                    .padding()
            }
            
            Button(action: {self.visible.toggle()}) {
                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(self.color)
            }.padding()
        }
        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color,lineWidth: 2))
        .padding(.top, 25)
        .padding()
    }
    
    
    
    var signUpButton: some View{
        Button(action: {cadastrarInstituicao()}, label: {
            Text("Cadastrar")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 50)
        })
        .background(Color("Roxo"))
        .cornerRadius(10)
        .padding(.top, 25)
}
var body: some View {
    VStack{
        emailField
        passwordField
        signUpButton
        
    }
    
}

func cadastrarInstituicao(){
    session.signUp(email: email, password: pass){ (result, error) in
        if error != nil {
            print("Error")
        } else {
            self.email = ""
            self.pass = ""
        }
    }
}



}

struct Cadastro_Previews: PreviewProvider {
    static var previews: some View {
        Cadastro()
    }
}
