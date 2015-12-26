//
//  IngredientesInterfaceController.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 26/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var jamon: WKInterfaceButton!
    @IBOutlet var pepperoni: WKInterfaceButton!
    @IBOutlet var pavo: WKInterfaceButton!
    @IBOutlet var salchicha: WKInterfaceButton!
    @IBOutlet var aceituna: WKInterfaceButton!
    @IBOutlet var cebolla: WKInterfaceButton!
    @IBOutlet var pimiento: WKInterfaceButton!
    @IBOutlet var piña: WKInterfaceButton!
    @IBOutlet var anchoa: WKInterfaceButton!
    
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
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        //        table.setRowTypes([String])
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func alerta() {
        let defaultAction = WKAlertAction(title: "OK", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
        })
        
        self.presentAlertControllerWithTitle("Alerta", message: "Solo se puede elegir 5 ingredientes, quita uno antes de elegir otro", preferredStyle: WKAlertControllerStyle.Alert, actions: [defaultAction])
    }
    
    func alertaSeleccion() {
        let defaultAction = WKAlertAction(title: "OK", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
        })
        
        self.presentAlertControllerWithTitle("Alerta", message: "Debe elegir al menos 1 ingrediente", preferredStyle: WKAlertControllerStyle.Alert, actions: [defaultAction])
    }
    
    
    @IBAction func pushToConfirmar() {
        print("pulsando")
        if ingredientes.count == 0{
            alertaSeleccion()
        } else {
            let c = Valores(t: tamaño, m: masa, q: queso, i: ingredientes)
            presentControllerWithName("Confirmar", context: c)
        }
    }
    
    @IBAction func jamonPressed() {
        
        
        let i = ingredientes.indexOf("Jamon")
        if i != nil {
            jamon.setBackgroundColor(UIColor.whiteColor())
            ingredientes.removeAtIndex(ingredientes.indexOf("Jamon")!)
        } else {
            if ingredientes.count == 5 {
                alerta()
            } else {
                jamon.setBackgroundColor(UIColor .greenColor())
                ingredientes.append("Jamon")
            }
        }
    }
    
    @IBAction func pepperoniPressed() {
        
        let i = ingredientes.indexOf("Pepperoni")
        if i != nil {
            pepperoni.setBackgroundColor(UIColor.whiteColor())
            ingredientes.removeAtIndex(ingredientes.indexOf("Pepperoni")!)
        } else {
            if ingredientes.count == 5 {
                alerta()
            } else {
                pepperoni.setBackgroundColor(UIColor .greenColor())
                ingredientes.append("Pepperoni")
            }
        }
    }
    
    @IBAction func pavoPressed() {
        
        let i = ingredientes.indexOf("Pavo")
        if i != nil {
            pavo.setBackgroundColor(UIColor.whiteColor())
            ingredientes.removeAtIndex(ingredientes.indexOf("Pavo")!)
        } else {
            if ingredientes.count == 5 {
                alerta()
            } else {
                pavo.setBackgroundColor(UIColor .greenColor())
                ingredientes.append("Pavo")
            }
        }
    }
    
    @IBAction func salchichaPressed() {
        
        let i = ingredientes.indexOf("Salchicha")
        if i != nil {
            salchicha.setBackgroundColor(UIColor.whiteColor())
            ingredientes.removeAtIndex(ingredientes.indexOf("Salchicha")!)
        } else {
            if ingredientes.count == 5 {
                alerta()
            } else {
                salchicha.setBackgroundColor(UIColor .greenColor())
                ingredientes.append("Salchicha")
            }
        }
    }
    
    @IBAction func aceitunaPressed() {
        
        let i = ingredientes.indexOf("Aceituna")
        if i != nil {
            aceituna.setBackgroundColor(UIColor.whiteColor())
            ingredientes.removeAtIndex(ingredientes.indexOf("Aceituna")!)
        } else {
            if ingredientes.count == 5 {
                alerta()
            } else {
                aceituna.setBackgroundColor(UIColor .greenColor())
                ingredientes.append("Aceituna")
            }
        }
    }
    
    @IBAction func cebollaPressed() {
        
        let i = ingredientes.indexOf("Cebolla")
        if i != nil {
            cebolla.setBackgroundColor(UIColor.whiteColor())
            ingredientes.removeAtIndex(ingredientes.indexOf("Cebolla")!)
        } else {
            if ingredientes.count == 5 {
                alerta()
            } else {
                cebolla.setBackgroundColor(UIColor .greenColor())
                ingredientes.append("Cebolla")
            }
        }
    }
    
    @IBAction func pimientoPressed() {
        
        let i = ingredientes.indexOf("Pimiento")
        if i != nil {
            pimiento.setBackgroundColor(UIColor.whiteColor())
            ingredientes.removeAtIndex(ingredientes.indexOf("Pimiento")!)
        } else {
            if ingredientes.count == 5 {
                alerta()
            } else {
                pimiento.setBackgroundColor(UIColor .greenColor())
                ingredientes.append("Pimiento")
            }
        }
    }
    
    @IBAction func piñaPressed() {
        
        let i = ingredientes.indexOf("Piña")
        if i != nil {
            piña.setBackgroundColor(UIColor.whiteColor())
            ingredientes.removeAtIndex(ingredientes.indexOf("Piña")!)
        } else {
            if ingredientes.count == 5 {
                alerta()
            } else {
                piña.setBackgroundColor(UIColor .greenColor())
                ingredientes.append("Piña")
            }
        }
    }
    
    @IBAction func anchoaPressed() {
        
        let i = ingredientes.indexOf("Anchoa")
        if i != nil {
            anchoa.setBackgroundColor(UIColor.whiteColor())
            ingredientes.removeAtIndex(ingredientes.indexOf("Anchoa")!)
        } else {
            if ingredientes.count == 5 {
                alerta()
            } else {
                anchoa.setBackgroundColor(UIColor .greenColor())
                ingredientes.append("Anchoa")
            }
        }
    }
    
}