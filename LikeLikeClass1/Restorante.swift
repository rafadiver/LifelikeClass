//
//  Restorante.swift
//  LikeLikeClass1
//
//  Created by Maria Susana Moline Venanzi on 12/10/17.
//  Copyright © 2017 HRApps. All rights reserved.
//

import Foundation
import UIKit

class Restorante: NSObject {
    
    var name : String!
    var image : UIImage!
    var tipo :  String!
    var comentarios :  [String]!
    var platillos : [String]!
    var ciudad: String!
    var location : String!
    
    var isFavorite: Bool = false
    
    
    
    init(name: String, image: UIImage, tipo: String, comentarios: [String], location: String) {
        self.name = name
        self.image = image
        self.tipo = tipo
        self.comentarios = comentarios
        self.location = location
        

    
    }
}

