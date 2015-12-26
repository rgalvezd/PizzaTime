//
//  MasaInterfaceController.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 26/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import WatchKit
import Foundation


class MasaInterfaceController: WKInterfaceController {

    @IBOutlet var picker: WKInterfacePicker!
    
    let masas : [String] = ["Delgada","Crujiente","Gruesa"]
    
    var tamaño : String = ""
    var masa : String = "Delgada"
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Valores
        tamaño = c.tamaño

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let pickerItems : [WKPickerItem] = masas.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            pickerItem.caption = "Masa"
            return pickerItem
        }
        picker.setItems(pickerItems)

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func pickerValueHasChanged(value: Int) {
        masa = masas[value]
        print(masa)
    }
    
    
    @IBAction func pushToQuesos() {
        print("pulsando")
        let c = Valores(t: tamaño, m: masa, q: "", i: [])
        presentControllerWithName("Queso", context: c)
    }
}
