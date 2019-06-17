//
//  alertUtility.swift
//  Alberto Virzì
//
//  Created by IED Student on 17/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class alertUtility {
    
    //Funzione che viene richiamata quando l'utente compie una scelta nell'alert di conferma (il parametro bool ci informa se ha premuto si oppure no)
    typealias completionAlertDiConferma = ((Bool) -> Void)

    static func mostraAlertDiConferma(conTitolo titolo: String?, messaggio: String?, viewController: UIViewController, completion: completionAlertDiConferma?) {
        
        //1 Creo l'alert
        let alert = UIAlertController.init(title: titolo, message: messaggio, preferredStyle: .alert)
        
        //2 Creo l'azione del tasto si
        let actionSi = UIAlertAction.init(title: "Si", style: .default) {
            
            (action) in
            //Comunico che l'utente ha premuto si alla classe che ha mostrato l'alert
            completion?(true)
            
        }
        
        //2B Aggiungo l'azione all'alert
        alert.addAction(actionSi)
        
        //3 Creo l'azione del tasto si
        let actionNo = UIAlertAction.init(title: "No", style: .cancel) {
            
            (action) in
            //Comunico che l'utente ha premuto si alla classe che ha mostrato l'alert
            completion?(false)
            
        }
        
        //3B Aggiungo l'azione all'alert
        alert.addAction(actionNo)
        
        //Mostra l'alert
        viewController.present(alert, animated: true)
        
    }
    
}
