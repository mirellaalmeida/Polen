//
//  OnboardsView.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct Onboards: View {
    
    var page: String
    
    var body: some View{
        if page == "1"{
            
            OnboardingView1()
            
        }else if page == "2"{
            
            OnboardingView2()
            
        }else {
            
            OnboardingView3()
            
        }
    }
}
