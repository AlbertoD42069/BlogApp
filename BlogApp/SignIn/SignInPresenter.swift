//
//  SignInPresenter.swift
//  BlogApp
//
//  Created by Jesus Alberto Diaz Dominguez on 31/05/22.
//

import Foundation
import Firebase

protocol SignInView {
    func Register(success: Bool)
}

class SignInPresenter {
    
    var view: SignInView?
    init(){
        
    }
    func attachView(_ view:SignInView){
        self.view = view
    }
    let db = Firestore.firestore()
    func register(nombre:String, edad:String, userName:String, pass:String){
        Auth.auth().createUser(withEmail: userName, password: pass) { result, error in
            self.view?.Register(success: true)
            if let result = result, error == nil {
                
                
                self.db.collection("usuario").document(userName).setData([
                    "Nombres": nombre ?? "",
                    "Edad": edad ?? ""], merge: true)
                
                let userDefailt = UserDefaults.standard
                userDefailt.set(userName, forKey: "email")
                userDefailt.set(pass, forKey: "pass")
                userDefailt.synchronize()
            }else{
                self.view?.Register(success: true)
            }
        }
        
    }
}
