//
//  DateUtility.swift
//  Alberto Virzì
//
//  Created by IED Student on 06/05/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class DateUtility: NSObject {
    
    //Converte un oggeto date in una stringa
    static func stringa(conData data:Date?, formato:String?) -> String? {
        
        //controllo che i valori siano validi
        guard let data = data, let formato = formato else{
            return nil 
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = formato
        return formatter.string(from: data)
    }
    
    //Converte una stringa in una data
    static func stringa(conStringa stringa:String?, formato:String?) -> Date? {
        
        //Controlla che i valori sono validi
        guard let stringa = stringa, let formato = formato else {
            return nil
        }
        
        //Converte l'oggetto di tipo "String" in "Date"
        let formatter = DateFormatter()
        formatter.dateFormat = formato
        return formatter.date(from: stringa)
        
    }
}
