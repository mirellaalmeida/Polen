//
//  Onboarding1.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct OnboardingView1: View {
    @Binding var tabViewIsActive: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack{
                ZStack{
                    Image("titleBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Text("Pólen é migrar")
                        .fontWeight(.bold)
                }
                .padding(.top, 50)
            
                    
               
                
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
            
            Button(action: {
                withAnimation(.easeOut(duration: 0.3)) {
                    UserDefaults.standard.set(true, forKey: "firstTimeUsing")
                    UserDefaults.standard.synchronize()
                    self.tabViewIsActive.toggle()
                }
            }, label: {
                Text("Pular")
                
            })
            .padding(10)
            .foregroundColor(.white)
        }
        
        .background(Image("BgLaranja")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .edgesIgnoringSafeArea(.top))
        .navigationBarHidden(true)
    }
    
}
struct OnboardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView1(tabViewIsActive: .constant(true))
    }
}
