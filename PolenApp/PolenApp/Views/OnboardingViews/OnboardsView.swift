//
//  OnboardsView.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct Onboards: View {
    
    var bg: String
    
    var body: some View{
        if bg == "1"{
            
            OnboardingView1()
            
        }else if bg == "2"{
            
            OnboardingView2()
            
        }else {
            
            OnboardingView3()
            
        }
    }
}
