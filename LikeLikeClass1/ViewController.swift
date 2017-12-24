//
//  ViewController.swift
//  LikeLikeClass1
//
//  Created by Maria Susana Moline Venanzi on 12/10/17.
//  Copyright © 2017 HRApps. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    var restorantes : [Restorante] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        var restorante = Restorante(name: "Wine & Rose", image: #imageLiteral(resourceName: "wine&rose"), tipo: "internacional", comentarios: ["bueno, agusto, pedir la terraza"],location: "Av. Javier Barros Sierra 540, Santa Fe, Zedec Sta Fé, 01210 Ciudad de México, CDMX")
        restorantes.append(restorante)
        
        
        restorante = Restorante(name: "Centralito", image: #imageLiteral(resourceName: "centralito interiores 1"),tipo: "frances", comentarios: ["buen ambiente, y buenos Gins"],location: "Anatole France 70, Polanco, Polanco III Secc, 11550 Ciudad de México, CDMX")
        restorantes.append(restorante)
        
        restorante = Restorante(name: "Prosseco Polanco", image: #imageLiteral(resourceName: "Prosecco_14_1750"), tipo: "italiano", comentarios: ["bueno", "comida rica"],location: "Virgilio 7, Polanco, Polanco III Secc, 11560 Ciudad de México, CDMX")
        restorantes.append(restorante)
        
        restorante = Restorante(name: "Kingfish", image: #imageLiteral(resourceName: "kingfish") , tipo: "mariscos", comentarios: ["bueno, agusto, pedir la terraza"],location: "Juan Salvador Agraz, Santa Fe, 05300 México Distrito Fede")
        restorantes.append(restorante)
        
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restorantes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restorante = restorantes[indexPath.row]
        let cellID = "RestoranteCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RestoranteCell
//         cell.textLabel?.text = restorante.name
//        cell.imageView?.image = restorante.image
        
        cell.thumbnailImageView.image = restorante.image
        cell.nameLabel.text = restorante.name
        cell.tipoLabel.text = restorante.tipo
        cell.ciudadLabel.text = "Mexico"
        
        
        cell.thumbnailImageView.layer.cornerRadius = 42.0
        cell.thumbnailImageView.clipsToBounds = true
        
        if restorante.isFavorite{
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        
        
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.restorantes.remove(at: indexPath.row)
            
        }
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        
        for restorante in self.restorantes {
            print(restorante.name)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
      
        //compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let shareDefaultText = "Estoy mirando el restorante \(self.restorantes[indexPath.row].name!) en la app del curso"
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.restorantes[indexPath.row].image!], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            
            
        }
        
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 154.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        // Borrar
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.restorantes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
            
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        
        return [shareAction, deleteAction]
        
        
    }
    
    
    //mark - UItableviewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("heseleccionado la fila \(indexPath.row)")
        

        /*let restorante = self.restorantes[indexPath.row]
        let alertcotroller = UIAlertController(title: restorante.name, message: "valor este plato", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertcotroller.addAction(cancelAction)
        var favoriteActionTitle = "Favorito"
        var favoriteActionStyle = UIAlertActionStyle.default
        if restorante.isFavorite {
            favoriteActionTitle = "No Favorito"
            favoriteActionStyle = UIAlertActionStyle.destructive
            
        }
        
        let favoriteAction = UIAlertAction(title: favoriteActionTitle, style: favoriteActionStyle) { (action) in
            
            let restorante = self.restorantes [indexPath.row]
            restorante.isFavorite = !restorante.isFavorite
            
            self.tableView.reloadData()
            
            
        }
        
        alertcotroller.addAction(favoriteAction)
        self.present(alertcotroller, animated: true, completion: nil)
   */
        
    
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showRestoranteDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRestorante = self.restorantes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewConroller
                destinationViewController.restorante = selectedRestorante
            }
        }
    }

}

