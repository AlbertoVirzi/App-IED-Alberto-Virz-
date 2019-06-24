//
//  Network.swift
//  Alberto Virzì
//
//  Created by IED Student on 10/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//Classe che si occupera di gestire tutte le chiamate ai servizi esterni all'app

import UIKit

class Network {

    //funzione per chiedere al server il meteo di Roma
    static func richiestaMeteoRoma(){
        
        //indirizzo del servizio web da richiamare
        let url = "http://ied.apptoyou.it/app/meteoroma.php"
        
        IEDNetworking.jsonGet(url: url, authToken: nil, parameters: nil) {
            
            //Questa parte di codice viene eseguita quando l'app riceve la risposta dal server
            (risposta) in
            
            if risposta.success {
                
                //Controllo se i dati ricevuti sono del tipo che mi aspettavo
                if let temperatura = risposta.data as? Int {
                    
                    print("La temperatura a Roma è di \(temperatura) °C ")
                    
                }
                
            }
            
        }
        
    }
    
    //Questo è il risultato della funzione di richiesta meteo evento
    typealias CompletionMeteo = ((Meteo?) -> Void)
    
    //Funzione per chiedere il meteo attuale di un evento specifico
    static func richiestaMeteoEvento(_ evento: Evento?, completion: CompletionMeteo?) {
        
       //Controllo validità dei dati
        guard let coordinate = evento?.coordinate else {
            
            //Dati non validi
            return
            
        }
        
        //Indirizzo we ìb a cui faccio la richiesta
        let url = "http://ied.apptoyou.it/app/weather.php"
        
        //Parametri da passare al servizio
        var parametri = IEDDictionary()
        
        parametri["appid"] = "7854e283b3c65ba9943d850e002019b4"
        parametri["units"] = "metric"
        parametri["lang"] = "it"
        
        parametri["lat"] = coordinate.latitude
        parametri["lon"] = coordinate.longitude
        
        IEDNetworking.jsonGet(url: url, authToken: nil, parameters: parametri) {
            
            //Questa parte di codice viene eseguita quando l'app riceve la risposta dal server
            (risposta) in
            
            if risposta.success {
                
                if let dictionary = risposta.data as? IEDDictionary {
                    
                    //Parse della risposta
                    let meteo = NetworkParser.parsMeteo(conData: dictionary)
                    
                    //Restituisce l'oggetto meteo alla funzione chiamata
                    completion?(meteo)
                    
                    print("La temperatura è: \(meteo?.temperatura ?? 0)" )
                    print("La temperatura è: \(meteo?.descrizione ?? "")" )
                    
                }
                
                
                
            }
            
        }
        
    }
    
    //Funzione
    typealias CompletionLogin = ((Utente?) -> Void)
    static func richiestaLogin(conEmail email: String?, password: String?, completion: CompletionLogin?) {
        
        //Controllo la validita dei dati
        guard let email = email, let password = password else {
            //Dati non validi
            completion?(nil)
            return
        }
        
        //indirizzo del servizio web da richiamare
        let url = "http://ied.apptoyou.it/app/login.php"
        
        //Parametri da passare al servizio
        var parametri = IEDDictionary()
        parametri["email"] = email
        parametri["password"] = password
        
        //Effetua la chiamata al serizio web
        IEDNetworking.jsonPost(url: url, authToken: nil, parameters: parametri) { (risposta) in
            //Questa parte di codice viene eseguita quando l'app riceve la risposta dal server
            if risposta.success {
                
                //Controllo se il server ha inviato i dati che mi aspettavo
                if let data = risposta.data as? IEDDictionary {
                    
                   //Controlla se ci sonoi dati ell'utente
                    if let datiUtente = data["data"] as? IEDDictionary{
                    
                        //Login Riuscito
                        //Parse della risposta
                        let utente = NetworkParser.parsUtente(conData: datiUtente)
                        
                        //Restituisci l'oggetto alla funzione chiamata
                        completion?(utente)
                        
                        return
                    }
                    
                }
                
            }
                
            //Login Fallito
            completion?(nil)

                    
        }
        
    }
    
}
