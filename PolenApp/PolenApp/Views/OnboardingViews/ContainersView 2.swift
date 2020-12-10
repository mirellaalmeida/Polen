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
    
    init(_ page: [String]) {
        self.controller = page.map { UIHostingController(rootView: Onboards(page: $0)) }
        
    }
    
    var body: some View {
        OnboardingPageViewController(controller: self.controller)
    }
}
