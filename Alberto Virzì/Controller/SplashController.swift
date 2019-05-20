//
//  SplashController.swift
//  Alberto Virzì
//
//  Created by IED Student on 08/04/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class SplashController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //controllo se c'è un utente connesso
        
        if LoginUtility.utenteConnesso == nil {
            //nessun utente connesso
            //vado alla pagina di login
            performSegue(withIdentifier: "vaiAlLogin", sender: self)
        }
        else{
            //utente connesso
            //vado alla pagina Home
            performSegue(withIdentifier: "dallaHome", sender: self)
        }
        
    }


}
