//
//  ContainersView.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 30/11/20.
//

import Foundation
import SwiftUI

struct ContainerViews: View {
    
    public var controller: [UIHostingController<Onboards>]
    
    init(_ bg: [String]) {
        self.controller = bg.map { UIHostingController(rootView: Onboards(bg: $0)) }
        
    }
    
    var body: some View {
        OnboardingPageViewController(controller: self.controller)
    }
}
