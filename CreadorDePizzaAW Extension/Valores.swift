//
//  Valores.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 26/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import UIKit

class Valores: NSObject {
    var tamaño : String = ""
    var masa : String = ""
    var queso : String = ""
    var ingredientes : [String] = []
    
    init(t:String, m:String, q:String, i:[String]) {
        tamaño = t
        masa = m
        queso = q
        ingredientes = i
    }
    
}
