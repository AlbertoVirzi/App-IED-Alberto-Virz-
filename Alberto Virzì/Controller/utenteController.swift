//
//  utenteController.swift
//  Alberto Virzì
//
//  Created by IED Student on 24/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class utenteController: UIViewController {
    
    //MARK - Outlets
    @IBOutlet weak var avatarImmage: UIImageView!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelCognome: UILabel!
    @IBOutlet weak var labelNascita: UILabel!
    @IBOutlet weak var labelCitta: UILabel!
    
    
    override func viewDidLoad() {
        
        setupUtente();
        
    }
    
    func setupUtente() {
        
        NetworkUtility.downloadImmagine(indirizzoWeb: LoginUtility.utenteConnesso?.avatarUrl, perImageView: avatarImmage)
        labelNome.text = LoginUtility.utenteConnesso?.nome
        labelCognome.text = LoginUtility.utenteConnesso?.cognome
        labelNascita.text = LoginUtility.utenteConnesso?.dataNascita
        labelCitta.text = LoginUtility.utenteConnesso?.citta
        
    }
    

}
