//
//  OnboardingView3.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct OnboardingView2: View {
    var body: some View {
        
        ZStack{
            Image("BgRoxo")
            VStack{
                Image("titleOnboarding2")
                    .padding([.top, .leading, .trailing])
                
                Image("imageOnboarding2").resizable().aspectRatio(CGSize(width: 6, height: 6), contentMode: .fit)
                
                Text("Você é uma instituição que apoia imigantes e refugiados?")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40.0)
                
                Text("Conecte-se com uma rede disposta a ajudar e receber apoio em suas atividades e ações")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.all, 30.0)
                
                OnboardingPageControl(current: 1)
                  
            }
        }
    }
}
