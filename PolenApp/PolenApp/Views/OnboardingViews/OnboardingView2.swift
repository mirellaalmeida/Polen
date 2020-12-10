//
//  OnboardingView2.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct OnboardingView2: View {
    @Binding var tabViewIsActive: Bool
    
    var body: some View {
        
        ZStack(alignment: .topTrailing){
            //            NavigationLink(
            //                destination: TabBarView( tabViewIsActive: $tabViewIsActive, tabSelected: ),
            //                isActive: $tabViewIsActive){
            //                EmptyView()
            //            }
            
            VStack {
                Image("titleOnboarding2")
                    .padding(.top, 25)
                
                Spacer()
                
                Image("imageOnboarding2").resizable().aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
                
                Spacer()
                
                Text("Você é uma instituição que apoia imigantes e refugiados?")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40.0)
                
                Spacer()
                
                Text("Conecte-se com uma rede disposta a ajudar e receber apoio em suas atividades e ações")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 28.0)
                    .padding(.vertical, 20)
                
                Spacer()
                
                OnboardingPageControl(current: 1)
            }
            
            Button(action: {
                withAnimation(.easeOut(duration: 0.3)) {
                    UserDefaults.standard.set(true, forKey: "firstTimeUsing")
                    UserDefaults.standard.synchronize()
                    self.tabViewIsActive.toggle()
                }
            }, label: {
                Text("Pular")
            }).padding(10)
            .foregroundColor(.white)
            
        }
        .background(Image("BgRoxo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .edgesIgnoringSafeArea(.top))
        .navigationBarHidden(true)
    }
}

struct OnboardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView2(tabViewIsActive: .constant(true))
    }
}
