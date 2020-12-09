//
//  InitialNavigationController.swift
//  PolenApp
//
//  Created by Jéssica Amaral on 06/12/20.
//

import SwiftUI

struct InitialNavigationController: View {
    @State var tabViewIsActive:Bool = false
    
    let notFirstLaunch = UserDefaults.standard.bool(forKey: "firstTimeUsing")

    
    var body: some View {
        if tabViewIsActive || notFirstLaunch {
            TabBarView(tabViewIsActive: $tabViewIsActive)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
        } else {
            Onboarding(tabViewIsActive: $tabViewIsActive)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
        }
    }
}

struct InitialNavigationController_Previews: PreviewProvider {
    static var previews: some View {
        InitialNavigationController()
    }
}
