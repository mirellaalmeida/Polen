//
//  FirebaseSession.swift
//  PolenApp
//
//  Created by Elaine  Cruz on 01/12/20.
//

import SwiftUI
import Firebase
import FirebaseAuth

class FirebaseSession: ObservableObject {
    
    //MARK: Properties
    @Published var session: User?
    @Published var isLoggedIn: Bool?

    
    //MARK: Functions
//    func listen() {
//        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
//            if let user = user {
//                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
//                self.isLoggedIn = true
//                self.getTODOS()
//            } else {
//                self.isLoggedIn = false
//                self.session = nil
//            }
//        }
//    }
    
    func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
//    func logOut() {
//            try! Auth.auth().signOut()
//            self.isLoggedIn = false
//            self.session = nil
//
//    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    
}
