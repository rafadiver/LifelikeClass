//
//  DetailViewConroller.swift
//  LikeLikeClass1
//
//  Created by Maria Susana Moline Venanzi on 12/12/17.
//  Copyright © 2017 HRApps. All rights reserved.
//

import UIKit

class DetailViewConroller: UIViewController {


    @IBOutlet weak var restorenteImage: UIImageView!
    
    @IBOutlet weak var tableViewD: UITableView!
    
    
    var restorante : Restorante!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.restorenteImage.image = self.restorante.image
        
        self.tableViewD.tableFooterView = UIView(frame: CGRect.zero)
        
        
        self.tableViewD.estimatedRowHeight = 50.0
        self.tableViewD.rowHeight = UITableViewAutomaticDimension
        
     
    }

}


extension DetailViewConroller : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestoranteViewCell", for: indexPath) as! RestoranteViewCell
        
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "nombre: "
            cell.valueLabel.text = self.restorante.name
        
        case 1:
            cell.keyLabel.text = "tipo: "
            cell.valueLabel.text = self.restorante.tipo
            
        case 2:
            cell.keyLabel.text = "favorito: "
            
            if self.restorante.isFavorite {
                cell.valueLabel.text = "Si"
            } else {
                cell.valueLabel.text = "No"
            }
        case 3:
            cell.keyLabel.text = "Direccion: "
            cell.valueLabel.text = self.restorante.location
            
            
        
        default: break
            
        }
        
        return cell
    }
    
    
    

    
}


extension DetailViewConroller : UITableViewDelegate {
    
    
}












