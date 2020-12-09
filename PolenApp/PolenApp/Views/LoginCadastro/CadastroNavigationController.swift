////
////  CadastroNavigationController.swift
////  PolenApp
////
////  Created by Jéssica Amaral on 07/12/20.
////
//
//import SwiftUI
//
//struct CadastroNavigationController: View {
//    @Binding var cadastroViewIsActive: Bool
//    @Binding var instituicaoID: String
//    
//    var body: some View {
//        if cadastroViewIsActive {
//            TabBarView(tabSelected: .constant(3), tabViewIsActive: $cadastroViewIsActive)
//                .transition(.identity)
//    
//        }
//        
//        if !(cadastroViewIsActive) {
//            CadastroView1(instituicaoID: $instituicaoID, cadastroIsActive: $cadastroViewIsActive)
//                .transition(.identity)
//        }
//    }
//}
//
////struct CadastroNavigationController_Previews: PreviewProvider {
////    static var previews: some View {
////        CadastroNavigationController()
////    }
////}
