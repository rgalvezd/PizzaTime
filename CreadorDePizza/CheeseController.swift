//
//  CheeseController.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 13/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import UIKit

protocol CheeseControllerDelegate{
    func updateData(tamaño tamaño:String, masa:String, queso:String, ingredientes:Array<String>)
}

class CheeseController: UIViewController, IngredientsControllerDelegate{
   
    var delegate:CheeseControllerDelegate? = nil
    
    @IBOutlet weak var opciones: UISegmentedControl!
    @IBOutlet weak var mensaje: UILabel!
    @IBOutlet weak var seleccion: UILabel!
    
    internal var tamaño:String?
    internal var masa:String?
    internal var queso: String?
    internal var ingredientes:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        seleccion.textColor = view.tintColor

        if queso != nil {
            switch(queso!){
            case "mozzarella":
                opciones.selectedSegmentIndex = 0
                break
            case "cheddar":
                opciones.selectedSegmentIndex = 1
                break
            case "parmesano":
                opciones.selectedSegmentIndex = 2
                break
                case "sin queso":
                opciones.selectedSegmentIndex = 3
            default:
                break
            }
            self.showMessageForSelection()
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cambioOpciones(sender: AnyObject) {
        
     self.showMessageForSelection()
        
    }
    
    private func showMessageForSelection() {
        switch (opciones.selectedSegmentIndex){
        case 0:
            mensaje.text = "Has seleccionado queso:"
            seleccion.text = "MOZZARELLA"
            break
        case 1:
            mensaje.text = "Has seleccionado queso:"
            seleccion.text = "CHEDDAR"
            break
        case 2:
            mensaje.text = "Has seleccionado queso:"
            seleccion.text = "PARMESANO"
            break
        case 3:
            mensaje.text = "Has seleccionado:"
            seleccion.text = "SIN QUESO"
        default:
            mensaje.text = ""
            seleccion.text = ""
            break
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let ic = segue.destinationViewController as! IngredientsController
        ic.delegate = self
        ic.tamaño = tamaño
        ic.masa = masa
        ic.queso = seleccion.text?.lowercaseString
        ic.ingredientes = ingredientes
    }

    @IBAction func unwindForCheese(segue:UIStoryboardSegue){ }
    
    func updateData(tamaño tamaño: String, masa: String, queso: String, ingredientes: Array<String>) {
        self.tamaño = tamaño
        self.masa = masa
        self.queso = queso
        self.ingredientes = ingredientes
    }
    
}
