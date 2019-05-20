//
//  CellOggettoAcquistabile.swift
//  Alberto Virzì
//
//  Created by IED Student on 13/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class CellOggettoAcquistabile: UICollectionViewCell {
    
    //MARK: - Setup Della cella
    
    @IBOutlet weak var imageBackground: UIImageView!
    
    @IBOutlet weak var containerInfo: UIView!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelDisponibilita: UILabel!
    
    @IBOutlet weak var containerPrezzo: UIView!
    
    @IBOutlet weak var labelPrezzo: UILabel!
    
    
    //QUEsta funzione si occupa di prendere tutte le informazioni dal modello OggettoAcquistabile e metterle su ogni elemento grafico della cella
    
    func setupConOggettoAcquistabile(_ oggetto: OggettoAcquistabile?) {
    
        //scarico l'immagine
        NetworkUtility.downloadImmagine(indirizzoWeb: oggetto?.immagineUrl, perImageView: imageBackground)
        
        labelNome.text = oggetto?.nome
        
        
        if let prezzo = oggetto?.prezzo, prezzo > 0.0 {
            
            labelPrezzo.text = String(format: "%.2f €", prezzo)
            
        } else {
            
            labelPrezzo.text = "gratis"
            
        }
        
        if let disponibilita = oggetto?.disponibilita, disponibilita > 0 {
            
            if disponibilita == 1 {
                
                labelDisponibilita.text = "\(disponibilita) disponibile"
                
            } else {
                
                 labelDisponibilita.text = "\(disponibilita) disponibili"
                
            }
        }  else {
            
            labelDisponibilita.text = "Nessuna Disponibilità"
            
        }
        
        
    }
        
}
