//
//  SignInViewController.swift
//  BlogApp
//
//  Created by Jesus Alberto Diaz Dominguez on 30/05/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignInViewController: UIViewController {

    var presenter: SignInPresenter?
    private let db = Firestore.firestore()
    
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var stackButtons: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registrarse"
        btnSignIn.setTitle("Registrarse", for: UIControl.State.normal)
        txtName.placeholder = "Nombre"
        txtAge.placeholder = "Edad"
        txtEmail.placeholder = "Email"
        txtPassword.placeholder = "Contraseña"
        
        presenter = SignInPresenter()
        presenter?.attachView(self)
        
    }


    @IBAction func btnActionSignIn(_ sender: Any) {
        if let email = txtEmail.text, let contraseña = txtPassword.text, let nombre = txtName.text, let edad = txtAge.text {
            presenter?.register(nombre: nombre, edad: edad, userName: email, pass: contraseña)
        }
    }

}
extension SignInViewController: SignInView {
    
    func Register(success: Bool) {
        if success {
            self.navigationController?.pushViewController(TabBarController(), animated: true)
            let alertaController = UIAlertController(title: "Guardado", message: "Registro existoso" , preferredStyle: .alert)
                alertaController.addAction(UIAlertAction(title: "aceptar", style: .default))
                self.present(alertaController, animated: true, completion: nil)
        }else {
            let alertController = UIAlertController(title: "Error", message: "Se a producido un error registrando el usario", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}
