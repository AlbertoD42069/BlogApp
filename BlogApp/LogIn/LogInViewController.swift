//
//  LogInViewController.swift
//  BlogApp
//
//  Created by Jesus Alberto Diaz Dominguez on 30/05/22.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    
    var presenter:LogInPresenter?
    

    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Iniciar Sesion"
        txtEmail.placeholder = "Email"
        txtPassword.placeholder = "Contraseña"
        btnLogIn.setTitle("Iniciar Sesion", for: UIControl.State.normal)
        btnSignIn.setTitle("Registrarse", for: UIControl.State.normal)
        
        presenter = LogInPresenter()
        presenter?.attachView(self)
    }

    @IBAction func btnActionLogIn(_ sender: Any) {
        if let email = txtEmail.text, let Contraseña = txtPassword.text {
            self.presenter?.login(email: email, pass: Contraseña)
            
        }
    }
    
    @IBAction func btnActionSignIn(_ sender: Any) {
        navigationController?.pushViewController(SignInViewController(), animated: true)
    }

}
extension LogInViewController: LogInView {
    func Login(success: Bool) {
        if success {
            self.navigationController?.pushViewController(TabBarController(), animated: true)
        }else {
            print("error en inicio de sesion")
        }
    }
    
    
}
