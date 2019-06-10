//
//  NetworkParser.swift
//  Alberto Virzì
//
//  Created by IED Student on 10/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit


//Classe che si occupa di trasformare le risposte dei servizi web in ogetti utilizabili dall'App

class NetworkParser {

    static func parsMeteo(conData data: IEDDictionary) -> Meteo? {
        
        let meteo = Meteo()
        
        //Traduzione dei dati inviati dal server
        if let main = data["main"] as? IEDDictionary{
            
            meteo.temperatura = main["temp"] as? Double
            
        }
        
        if let weather = data["weather"] as? IEDArray{
            
            if let firstweather = weather.first{
                
                meteo.descrizione = firstweather["description"] as? String
                
            }
            
        }
        
        return meteo
        
    }
    
}
