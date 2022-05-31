//
//  LogInPresenter.swift
//  BlogApp
//
//  Created by Jesus Alberto Diaz Dominguez on 31/05/22.
//

import Foundation
import Firebase

protocol LogInView {
    func Login(success: Bool)
}

class LogInPresenter {
    
    var view: LogInView?
    
    init(){
    }
    
    func attachView(_ view:LogInView){
        self.view = view
    }
    
    func login(email:String, pass:String){
        Auth.auth().signIn(withEmail: email, password: pass) { result, error in
            if let result = result, error == nil {
                self.view?.Login(success: true)
                let userDefailt = UserDefaults.standard
                userDefailt.set(email, forKey: "email")
                userDefailt.set(pass, forKey: "pass")
                userDefailt.synchronize()
            }else{
                self.view?.Login(success: false)
            }
        }
    }
}

