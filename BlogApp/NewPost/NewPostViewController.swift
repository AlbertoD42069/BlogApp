//
//  NewPostViewController.swift
//  BlogApp
//
//  Created by Jesus Alberto Diaz Dominguez on 30/05/22.
//

import UIKit

import FirebaseAuth
import FirebaseFirestore

class NewPostViewController: UIViewController {

    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var txtContents: UITextField!
    @IBOutlet weak var lblPublicationDate: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var txtPublicationTitle: UITextField!
    @IBOutlet weak var lblTitle: UILabel!
    
    var presenter : NewPostPresenter?
    let date = Date()
    private let db = Firestore.firestore()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.presenter = NewPostPresenter()
        self.presenter?.attachView(self)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getData()
        lblTitle.textAlignment = .center
        lblTitle.text = "Nueva Publicación"
        txtPublicationTitle.placeholder = "Titulo de publicacion"
        txtContents.placeholder = "Contenido de publicación"
        btnPost.setTitle("Publicar", for: UIControl.State.normal)
        getDate()
    }
    @IBAction func btnActionPost(_ sender: Any) {
        if let publicationTitle = txtPublicationTitle.text, let author = lblAuthor.text, let publicationDate = lblPublicationDate.text, let contents = txtContents.text {
            presenter?.newPost(titlePost: publicationTitle, nombre: author, publicationDate: publicationDate, contents: contents)
        }
    }
    func getDate(){
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .full
        let dateview = dateFormat.string(from: date)
        lblPublicationDate.text = dateview
    }
}

extension NewPostViewController: NewPostView {
    func NewPost(success: Bool) {
        if success {
            let alertaController = UIAlertController(title: "Guardado", message: "Puublicacion guardada" , preferredStyle: .alert)
                alertaController.addAction(UIAlertAction(title: "aceptar", style: .default))
                self.present(alertaController, animated: true, completion: nil)
        }else {
            let alertController = UIAlertController(title: "Error", message: "Se a producido un al guardar la publicacion", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }

    }
    
    func refresh(_ data: NewPostViewData) {
        self.lblAuthor.text = data.name
    }
    
    
}
