//
//  CarrelloController.swift
//  Alberto Virzì
//
//  Created by IED Student on 17/06/2019.
//  Copyright © 2019 IED Student. All rights reserved.
//

import UIKit

class CarrelloController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK - Outlets
    @IBOutlet weak var tableView: UITableView!

    
    //MARK - Setup
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //tableView
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    //MARK - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CartUtility.carrello.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCarrello") as! CellCarrello
        
        let oggetto = CartUtility.carrello[indexPath.row]
        cell.setupConOggettoAcquistabile(oggetto)
        
        return cell
    }

}
