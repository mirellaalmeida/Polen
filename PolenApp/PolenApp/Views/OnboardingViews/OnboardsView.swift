//
//  OnboardsView.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct Onboards: View {
    @Binding var tabViewIsActive: Bool
    
    var page: String
    
    var body: some View{
        if page == "1"{
            
            OnboardingView1(tabViewIsActive: $tabViewIsActive)
            
        }else if page == "2"{
            
            OnboardingView2(tabViewIsActive: $tabViewIsActive)
            
        }else {
            
            OnboardingView3(tabViewIsActive: $tabViewIsActive)
            
        }
    }
}
