//
//  PinMappa.swift
//  Alberto Virzì
//
//  Created by IED Student on 20/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit
import MapKit

//Ogetto creato per poter aggiungere pin sulla mappa
class PinMappa: NSObject, MKAnnotation {

    //Variabili richieste dal protocollo
    var title: String?
    var subtitle: String?
    var coordinate = CLLocationCoordinate2D()
    
    //Variabile utilizzata per risalire facilmente all'evento associato
    var eventoAssociato: Evento?
    
    convenience init(conEvento evento: Evento) {
        
        //Funzione init semplificata per gli eventi
        self.init()
        
        //Tengo un riferimento all'evento utilizzato per la creazione del pin
        eventoAssociato = evento
        
        //Copio i dati dell'evento
        title = evento.nome
        subtitle = evento.indirizzo
        
        if let coordinateEvento = evento.coordinate {
            
            coordinate = coordinateEvento
            
        }
        
    }
    
}
