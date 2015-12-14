//
//  SizeController.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 13/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import UIKit


class SizeController : UIViewController, MassControllerDelegate {
    
    @IBOutlet weak var opciones: UISegmentedControl!
    @IBOutlet weak var mensaje: UILabel!
    @IBOutlet weak var seleccion: UILabel!
    
    internal var tamaño:String?
    internal var masa:String?
    internal var queso: String?
    internal var ingredientes:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // para mantener los colores a la hora de mostrar la selección, igualamos el color del texto al de la tintura de la vista
        seleccion.textColor = view.tintColor
                
        if tamaño != nil {
            switch(tamaño!){
            case "pequeña":
                opciones.selectedSegmentIndex = 0
                break
            case "mediana":
                opciones.selectedSegmentIndex = 1
                break
            case "grande":
                opciones.selectedSegmentIndex = 2
                break
            default:
                break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cambioOpciones(sender: AnyObject) {
        
        switch (opciones.selectedSegmentIndex){
        case 0:
            mensaje.text = "Has seleccionado tamaño:"
            seleccion.text = "PEQUEÑA"
            break
        case 1:
            mensaje.text = "Has seleccionado tamaño:"
            seleccion.text = "MEDIANA"
            break
        case 2:
            mensaje.text = "Has seleccionado tamaño:"
            seleccion.text = "GRANDE"
            break
        default:
            mensaje.text = ""
            seleccion.text = ""
            break
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let mc = segue.destinationViewController as! MassController
        mc.delegate = self
        mc.tamaño = seleccion.text?.lowercaseString
        mc.masa = self.masa
        mc.queso = self.queso
        mc.ingredientes = self.ingredientes
    }
    
    func updateData(tamaño tamaño: String, masa: String, queso: String, ingredientes: Array<String>) {
        self.tamaño = tamaño
        self.masa = masa
        self.queso = queso
        self.ingredientes = ingredientes
    }
    
    @IBAction func unwindForSize(segue:UIStoryboardSegue){ }
}