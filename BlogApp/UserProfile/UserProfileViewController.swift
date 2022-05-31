//
//  UserProfileViewController.swift
//  BlogApp
//
//  Created by Jesus Alberto Diaz Dominguez on 30/05/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class UserProfileViewController: UIViewController {

    var presenter: ProfilePresenter?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSignOff: UIButton!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    private let db = Firestore.firestore()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.presenter = ProfilePresenter()
        self.presenter?.attachView(self)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getData()
        imgProfile.image = UIImage(systemName: "person.fill")
        btnSignOff.setTitle("Cerrar Sesion", for: UIControl.State.normal)
        lblTitle.textAlignment = .center
        lblTitle.text = "Perfil Usuario"
        
    }

    @IBAction func btnActionSignOff(_ sender: Any) {
        do {
            
            let result = try? Auth.auth().signOut()
            if (result != nil) {
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if  let initialViewController = storyboard.instantiateInitialViewController() {
                        initialViewController.modalPresentationStyle = .fullScreen
                        self.present(initialViewController, animated: true) {
                            self.navigationController?.viewControllers.removeAll()
                                
                            }
                        }
                }
            }
        }catch{
            print("error")
        }
    }
}

extension UserProfileViewController: ProfileView {
    func refresh(_ data: ProfileViewData) {
        self.lblName.text = data.name
        self.lblAge.text = data.age
        lblEmail.text = data.email
    }
    
    
}
