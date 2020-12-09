//
//  ContainersView.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct ContainerViews: View {
    @Binding var tabViewIsActive: Bool
    public var page: [String]
    
    var body: some View {
        OnboardingPageViewController(controller: page.map {
            UIHostingController(rootView: Onboards(tabViewIsActive: $tabViewIsActive, page: $0))
        })
    }
}
