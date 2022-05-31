//
//  TabBarController.swift
//  BlogApp
//
//  Created by Jesus Alberto Diaz Dominguez on 30/05/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        let Publications = TablePublicationsViewController()
        let NewPost = NewPostViewController()
        let Profile = UserProfileViewController()
        
        Publications.title = "Home"
        NewPost.title = "Nueva Publicación"
        Profile.title = "Sesion"
        
        self .setViewControllers([Publications,NewPost,Profile], animated: true)
        guard let items = self.tabBar.items else {return}
        let imagenes =
        ["house.fill","star.fill","person.fill"]
        for x in 0...2 {
            items[x].image = UIImage(systemName: imagenes[x])
    
        // Do any additional setup after loading the view.
    }
    }
}
