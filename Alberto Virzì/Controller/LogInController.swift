//
//  LogInController.swift
//  Alberto Virzì
//
//  Created by IED Student on 01/04/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class LogInController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var textEmail: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    
    @IBOutlet weak var buttonAccedi: UIButton!
    
    //MARK: - Setup della schermata
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Arrotonda textEmail
        textEmail.layer.cornerRadius = textEmail.frame.size.height / 2.0;
        textEmail.layer.masksToBounds = true
        
        //Arrotonda textPassword
        textPassword.layer.cornerRadius = textPassword.frame.size.height / 2.0;
        textPassword.layer.masksToBounds = true
        
        //Arrotonda buttonAccedi
        buttonAccedi.layer.cornerRadius = buttonAccedi.frame.size.height / 2.0;
        buttonAccedi.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Funzioni
    
    private func controllaValiditaDatiInseriti() -> Bool {
        
        //Controllo il campo dell'email
        if textEmail.text == nil || textEmail.text == "" {
            alertUtility.mostraAlert(conTitolo: "Errore", messaggio: "Devi specificare l'email", viewController: self)
            return false
            
        }
        //Controllo il campo della password
        if textPassword.text == nil || textPassword.text == "" {
            alertUtility.mostraAlert(conTitolo: "Errore", messaggio: "Devi specificare la password", viewController: self)
            return false
            
        }
        
        //Tutto ok
        return true
        
    }
    
    
    //MARK: - Actions
    
    @IBAction func button(_ sender: Any) {
        
        guard controllaValiditaDatiInseriti() else {
            //Dati non validi
            return
        }
        
        print("Dati Validi")
        Network.richiestaLogin(conEmail: textEmail.text, password: textPassword.text) { (utente) in
            
            if let utente = utente {
                
               //login riuscito
                print("login riuscito")
                
                //Salvo l'utente in memoria
                LoginUtility.utenteConnesso = utente
                
                //Vado alla schermata principale dell'app
                self.performSegue(withIdentifier: "vaiAllaHome", sender: self)
            } else{
                
                //login fallito
                alertUtility.mostraAlert(conTitolo: "Errore", messaggio: "Login Fallito", viewController: self)
                
            }
        }
        
    }
}
