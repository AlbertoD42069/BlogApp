//
//  ViewController.swift
//  BlogApp
//
//  Created by Jesus Alberto Diaz Dominguez on 30/05/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var stackButtons: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bienvenido"
        btnLogIn.setTitle("Iniciar Sesion", for: UIControl.State.normal)
        btnSignIn.setTitle("Registrarse", for: UIControl.State.normal)
    }
    
    @IBAction func btnActionLogIn(_ sender: Any) {
        navigationController?.pushViewController(LogInViewController(), animated: true)
    }
    @IBAction func btnActionSignIn(_ sender: Any) {
        navigationController?.pushViewController(SignInViewController(), animated: true)
    }
}

