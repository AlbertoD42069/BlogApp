//
//  NewPostPresenter.swift
//  BlogApp
//
//  Created by Jesus Alberto Diaz Dominguez on 31/05/22.
//

import Foundation
import Firebase

struct NewPostViewData {
    let name : String
    let email : String
}
protocol NewPostView {
    func refresh(_ data: NewPostViewData)
    func NewPost(success: Bool)
}

class NewPostPresenter {
    var view:NewPostView?
    
    init(){
        
    }
    func attachView(_ view:NewPostView){
        self.view = view
    }
    
    let db = Firestore.firestore()
    func getData(){
        guard let email = UserDefaults.standard.value(forKey: "email") as? String else {
            return
        }
         db.collection("usuario").document(email).getDocument{
            (documentSnapshot, error) in
            if let document = documentSnapshot, error == nil {
                if let usuario = document.get("Nombres") as? String
                {
                   let data = NewPostViewData(name: usuario, email: email)
                    self.view?.refresh(data)
                }
             }
         }
    }
    
    func newPost(titlePost: String, nombre: String, publicationDate: String, contents: String){
        self.view?.NewPost(success: true)
        db.collection("Publicaciones").document(nombre).setData([
            "titulo publicacion": titlePost,
            "Autor": nombre,
            "Fecha publicacion": publicationDate,
            "contenido": contents
        ])
    }
}
