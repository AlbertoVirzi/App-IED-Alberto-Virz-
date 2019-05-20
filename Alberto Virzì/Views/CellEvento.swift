//
//  CellEvento.swift
//  Alberto Virzì
//
//  Created by IED Student on 08/04/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class CellEvento: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelIndirizzo: UILabel!
    
    @IBOutlet weak var labelPrezzo: UILabel!
    
    @IBOutlet weak var imageCopertina: UIImageView!
    
    //MARK - Setup della Cella
    
    // questa funzione si occupa di prendere tutte le informazioni del modello evento e metterle su ogni elemento grafico
    func setupConEvento(_ evento: Evento) {
        labelNome.text = evento.nome
        labelIndirizzo.text = evento.indirizzo
        
        if let prezzo = evento.prezzo, prezzo > 0.0 {
            labelPrezzo.text = String(format: "%.2f € 1'ora", prezzo)
            
        } else {
            labelPrezzo.text = "gratis"
        }
        //metto l'imagine sulla cell
        NetworkUtility.downloadImmagine(indirizzoWeb: evento.copertinaUrl, perImageView: imageCopertina)
        
        //Metto la data
        labelData.text = DateUtility.stringa(conData: evento.data, formato: "dd/MM/yyyy")
    }
    
}
