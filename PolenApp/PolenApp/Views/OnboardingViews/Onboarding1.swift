//
//  Onboarding1.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct OnboardingView1: View {
    var body: some View {
        
        ZStack{
            Image("BgLaranja")
            VStack{
                Image("titleOnboarding1")
                    .padding(.all)
                
                Text("Quem migra percorre caminhos de solidaridade através de experiências e trajetórias pelo mundo")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.all, 40)
                
                Image("imageOnboarding1").resizable().aspectRatio(CGSize(width: 4, height: 3), contentMode: .fit)
            }
        }
    }
}
