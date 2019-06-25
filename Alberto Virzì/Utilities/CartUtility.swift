//
//  CartUtility.swift
//  Alberto Virzì
//
//  Created by IED Student on 17/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

//Classe che gestisce il carrello degli oggetti acquistabili
class CartUtility {

    static var carrello: [OggettoAcquistabile] = []
    
    //Funzione che aggiunge articoli al carrelo solo se non sono ancora stati aggiunti
    static func aggiungiAlCarrello(_ oggetto: OggettoAcquistabile) {
        
        //1 Controllare se l'oggetto è gia nel carrelo
        for ricercaOggetto in carrello {
            
            if ricercaOggetto.nome == oggetto.nome
            {
                return
            }
            
        }
        //2 Aggiungere l'oggetto al carrello
        carrello.append(oggetto)
        //Inesco un suono di acquisto
        Sound.play(file: "suonoDiAcquisto.wav")
        print(carrello)
        
    }
    
    static func iconaCarrello() -> UIImage? {
        
        var image: UIImage?
        
        
        if carrello.count > 0 {
            
            //Carrello pieno
            image = UIImage(named: "cart")
        
        } else {
            
            //Carrello Vuoto
            image = UIImage(named: "shoppingCartEmpty")
            
        }
        image = UIutility.resizeImage(image, targetSize: CGSize(width: 34.0, height: 34.0))
        image = image?.withRenderingMode(.alwaysOriginal)
        
        return image
    }
    
    //Funzione che rimuove articoli dal carrelo
    static func rimuoviDalCarrello (_ oggetto: OggettoAcquistabile) {
        
        if let index = carrello.index(of: oggetto ) {
            carrello.remove(at: index)
        }
        
    }
    
}
