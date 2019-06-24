//
//  CellCarrello.swift
//  Alberto Virzì
//
//  Created by IED Student on 17/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class CellCarrello: UITableViewCell {

    //MARK - Outlets
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelTipo: UILabel!
    
    
    //MARK - Setup
    func setupConOggettoAcquistabile(_ oggetto: OggettoAcquistabile?) {
        labelNome.text = oggetto?.nome
        if(oggetto is Evento)
        {
            labelTipo.text = "Biglietto evento"
        } else {
            labelTipo.text = "Oggetto acquistabile"
        }
    }
    

}
