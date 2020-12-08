//
//  Onboarding1.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct OnboardingView1: View {
    @State var tabViewIsActive = false

    
    var body: some View {
        
        ZStack(alignment: .topTrailing){
            
            NavigationLink(
                destination: TabBarView( tabViewIsActive: $tabViewIsActive),
                isActive: $tabViewIsActive){
                EmptyView()
            }
            
                VStack{
                    Image("titleOnboarding1")
                        .padding(.top, 25)
                    
                    Spacer()
                    //.frame(height: 50)
                    
                    Text("Quem migra percorre caminhos de solidaridade através de experiências e trajetórias pelo mundo")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.all, 40)
                    
                    Image("imageOnboarding1").resizable().aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
                    
                    Spacer()
                    //.frame(height: 50)
                    
                    OnboardingPageControl(current: 0).padding()
                }
            
            Button(action: {self.tabViewIsActive.toggle()}, label: {
                    Text("Pular")
                }).padding(10)
                .foregroundColor(.white)
            
            }.background(Image("BgLaranja")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .ignoresSafeArea())
        .navigationBarHidden(true)
    }
}

struct OnboardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView1()
    }
}
