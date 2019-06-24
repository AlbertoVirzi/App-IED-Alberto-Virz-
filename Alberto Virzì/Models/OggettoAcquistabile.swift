//
//  OggettoAcquistabile.swift
//  Alberto Virzì
//
//  Created by IED Student on 13/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class OggettoAcquistabile: Comparable {
    static func < (lhs: OggettoAcquistabile, rhs: OggettoAcquistabile) -> Bool {
        return (lhs.id ?? 0) < (rhs.id ?? 0)
    }
    
    static func == (lhs: OggettoAcquistabile, rhs: OggettoAcquistabile) -> Bool {
        //Confronto i nomi perche gli oggetti acquistabili non hannoo un id valorizzato
        return lhs.nome == rhs.nome
        //return lhs.id == rhs.id
    }
    
    
    var id: Int?
    
    var nome: String?
    
    var disponibilita: Int?
    
    var prezzo: Double?
    
    var immagineUrl: String?
    
    
    

}
