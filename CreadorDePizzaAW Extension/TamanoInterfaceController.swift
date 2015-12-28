//
//  TamañoInterfaceController.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 26/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import WatchKit
import Foundation


class TamanoInterfaceController: WKInterfaceController {
    
    let tamaños:[String] = ["Pequeña","Mediana","Grande"]
    
    var tamaño : String = "Pequeña"
    
    
    @IBOutlet var picker: WKInterfacePicker!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let pickerItems : [WKPickerItem] = tamaños.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            pickerItem.caption = "Tamaño"
            return pickerItem
        }
        picker.setItems(pickerItems)
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func pickerValueHasChanged(value: Int) {
        tamaño = tamaños[value]
        print(tamaño)
    }
    
    @IBAction func pushToMasa() {
        print("pulsando")
        let c = Valores(t: tamaño, m: "", q: "", i: [])
        presentControllerWithName("Masa", context: c)
        
    }
}
