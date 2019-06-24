//
//  MaintabbarController.swift
//  Alberto Virzì
//
//  Created by IED Student on 20/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class MaintabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tabBar.tintColor = UIColor.red
        
        if let tabBarItems = tabBar.items {
            
            let dimensioniIcone = CGSize(width: 30.0, height: 30.0)
            
            //Home
            if tabBarItems.count >= 1 {
                
                let itemHome = tabBarItems[0]
                
                itemHome .title = "Home"
                let image  = UIImage(named: "icon")
                itemHome.image = UIutility.resizeImage(image, targetSize: dimensioniIcone)
                
            }
            //Mappa
            if tabBarItems.count >= 2 {
                
                let itemMap = tabBarItems[1]
                
                itemMap .title = "Mappa"
                let image  = UIImage(named: "maps-and-flags")
                itemMap.image = UIutility.resizeImage(image, targetSize: dimensioniIcone)
                
            }
            //Utente
            if tabBarItems.count >= 3 {
                
                let itemUtente = tabBarItems[2]
                
                itemUtente.title = "Utente"
                let image  = UIImage(named: "user")
                itemUtente.image = UIutility.resizeImage(image, targetSize: dimensioniIcone)
                
            }
            
            
        }
    }

}
