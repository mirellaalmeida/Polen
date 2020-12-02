//
//  Onboarding.swift
//  PolenApp
//
//  Created by Mirella Almeida on 16/11/20.
//

import SwiftUI

struct Onboarding: View {
    
    @State var mapaIsActive = false

    
    var body: some View {
        NavigationView{
            ZStack(alignment: .topTrailing){
                
                ContainerViews(["1", "2", "3"]).edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding().ignoresSafeArea(.all, edges: .all)
    }
}
