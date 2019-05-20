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
    
    
    //MARK: - Actions
    
    @IBAction func button(_ sender: Any) {
        
        if textEmail.text == "nome@gmail" {
            
            if textPassword.text == "password" {
                
                print("accesso eseguito");
                
                performSegue(withIdentifier: "vaiAllaHome", sender: self)
                
            }
            
        }
        
    }
}
