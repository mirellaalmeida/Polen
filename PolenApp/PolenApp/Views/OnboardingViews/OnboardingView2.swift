//
//  OnboardingView2.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct OnboardingView3: View {
    var body: some View {
        
        ZStack{
            Image("BgVerde")
            VStack{
                Image("titleOnboarding3")
                    .padding([.top, .leading, .trailing])
                
                Text("Vamos florescer juntos essa jornada com instituições parceiras")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.all, 30.0)
                
                Image("imageOnboarding3").resizable().aspectRatio(CGSize(width: 6, height: 6), contentMode: .fit)
                
                OnboardingPageControl(current: 2)
                
                Button(action: {print("clicou")}, label: {
                    Text("Conheça novas instituições")
                })
                
            }
        }
    }
}
