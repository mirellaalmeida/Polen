//
//  OnboardingView3.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct OnboardingView3: View {
    @Binding var tabViewIsActive: Bool
    @State var tabSelected: Int? = 3
    
    var body: some View {
        
        ZStack(alignment: .topTrailing){
            //            NavigationLink(
            //                destination: TabBarView( tabSelected: $tabSelected, tabViewIsActive: $tabViewIsActive),
            //                isActive: $tabViewIsActive){
            //                EmptyView()
            //            }
            
            VStack{
                ZStack{
                    Image("titleBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Text("Pólen é florescer")
                        .fontWeight(.bold)
                }
                .padding(.top, 50)
                
                Spacer()
                
                Text("Vamos florescer juntos essa jornada com instituições parceiras")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Image("imageOnboarding3").resizable().aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeOut(duration: 0.3)) {
                        UserDefaults.standard.set(true, forKey: "firstTimeUsing")
                        UserDefaults.standard.synchronize()
                        self.tabViewIsActive.toggle()
                    }
                }, label: {
                    ZStack {
                        Image("BotaoOnboarding")
                        Text("Conheça novas instituições")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                })
                .foregroundColor(.white)
                
                Spacer()
                
                OnboardingPageControl(current: 2)
            }
        }
        .background(Image("BgVerde")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .edgesIgnoringSafeArea(.top))
        .navigationBarHidden(true)
    }
}

struct OnboardingView3_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView3(tabViewIsActive: .constant(true))
    }
}
