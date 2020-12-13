//
//  Onboarding.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI
var primeiroAcesso: Bool = true

struct Onboarding: View {
    @Binding var tabViewIsActive: Bool
    
    var body: some View {
        //NavigationView{
        
        ZStack(alignment: .topTrailing){
            ContainerViews(tabViewIsActive: $tabViewIsActive, page: ["1", "2", "3"]).edgesIgnoringSafeArea(.top)
        }
        //}
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(tabViewIsActive: .constant(true)).ignoresSafeArea(.all, edges: .all)
    }
}
