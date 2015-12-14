//
//  MassController.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 13/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import UIKit

protocol MassControllerDelegate{
    func updateData(tamaño tamaño:String, masa:String, queso:String, ingredientes:Array<String>)
}

class MassController: UIViewController, CheeseControllerDelegate {
    
    var delegate:MassControllerDelegate? = nil

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
        
        if masa != nil {
            switch(masa!){
            case "delgada":
                opciones.selectedSegmentIndex = 0
                break
            case "crujiente":
                opciones.selectedSegmentIndex = 1
                break
            case "gruesa":
                opciones.selectedSegmentIndex = 2
                break
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
            mensaje.text = "Has seleccionado masa:"
            seleccion.text = "DELGADA"
            break
        case 1:
            mensaje.text = "Has seleccionado masa:"
            seleccion.text = "CRUJIENTE"
            break
        case 2:
            mensaje.text = "Has seleccionado masa:"
            seleccion.text = "GRUESA"
            break
        default:
            mensaje.text = ""
            seleccion.text = ""
            break
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cc = segue.destinationViewController as! CheeseController
        cc.delegate = self
        cc.tamaño = tamaño
        cc.masa = seleccion.text?.lowercaseString
        cc.queso = queso
        cc.ingredientes = ingredientes
    }

    @IBAction func unwindForMass(segue:UIStoryboardSegue){
        delegate?.updateData(tamaño: self.tamaño!, masa: self.masa!, queso: self.queso!, ingredientes: self.ingredientes)
    }
    
    func updateData(tamaño tamaño: String, masa: String, queso: String, ingredientes: Array<String>) {
        self.tamaño = tamaño
        self.masa = masa
        self.queso = queso
        self.ingredientes = ingredientes
    }

}