//
//  QuesoInterfaceController.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 26/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import WatchKit
import Foundation


class QuesoInterfaceController: WKInterfaceController {

    let quesos : [String] = ["Mozzarella","Parmesano","Cheddar","Sin Queso"]
    
    var tamaño : String = ""
    var masa : String = ""
    var queso : String = "Mozzarella"
    
    @IBOutlet var picker: WKInterfacePicker!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Valores
        tamaño = c.tamaño
        masa = c.masa
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let pickerItems : [WKPickerItem] = quesos.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            pickerItem.caption = "Queso"
            return pickerItem
        }
        picker.setItems(pickerItems)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func pickerValueHasChanged(value: Int) {
        queso = quesos[value]
        print(queso)
    }
    
    @IBAction func pushToIngredientes() {
        print("pulsando")
        let c = Valores(t: tamaño, m: masa, q: queso, i: [])
        presentControllerWithName("Ingredientes", context: c)
    }
    
}
