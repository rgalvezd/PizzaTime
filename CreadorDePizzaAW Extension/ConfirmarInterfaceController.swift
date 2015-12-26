//
//  ConfirmarInterfaceController.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 26/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmarInterfaceController: WKInterfaceController {

    @IBOutlet var lblTamaño: WKInterfaceLabel!
    @IBOutlet var lblMasa: WKInterfaceLabel!
    @IBOutlet var lblQueso: WKInterfaceLabel!
    @IBOutlet var lblIngredientes: WKInterfaceLabel!
    
    
    var tamaño : String = ""
    var masa : String = ""
    var queso : String = ""
    var ingredientes : [String] = []
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Valores
        tamaño = c.tamaño
        masa = c.masa
        queso = c.queso
        ingredientes = c.ingredientes
        
        lblTamaño.setText("Tamaño: \(tamaño)")
        lblMasa.setText("Masa: \(masa)")
        lblQueso.setText("Queso: \(queso)")
        lblIngredientes.setText("Ingredientes: \(ingredientes.joinWithSeparator(", "))")
    }


    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
