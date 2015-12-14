//
//  ConfirmController.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 13/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import UIKit

class ConfirmController: UIViewController {
    
    
    @IBOutlet weak var lblTamaño: UILabel!
    @IBOutlet weak var lblMasa: UILabel!
    @IBOutlet weak var lblQueso: UILabel!
    @IBOutlet weak var ing1:UILabel!
    @IBOutlet weak var ing2:UILabel!
    @IBOutlet weak var ing3:UILabel!
    @IBOutlet weak var ing4:UILabel!
    @IBOutlet weak var ing5:UILabel!

    internal var tamaño:String?
    internal var masa:String?
    internal var queso: String?
    internal var ingredientes:Array<String> = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if tamaño != ""{
            lblTamaño.text = tamaño?.capitalizedString
            lblTamaño.textColor = UIColor.blackColor()

        } else {
            lblTamaño.text = "N/D"
            lblTamaño.textColor = UIColor.redColor()
        }
        
        if masa != "" {
            lblMasa.text = masa?.capitalizedString
            lblMasa.textColor = UIColor.blackColor()
        } else {
            lblMasa.text = "N/D"
            lblMasa.textColor = UIColor.redColor()
        }
        
        if queso != "" {
            lblQueso.text = queso?.capitalizedString
            lblQueso.textColor = UIColor.blackColor()
        } else {
            lblQueso.text = "N/D"
            lblQueso.textColor = UIColor.redColor()
        }
        
        // Ingredientes
        let ingNum = ingredientes.count
        
        ingredientes = ingredientes.sort()
        
        if ingNum > 0 {
            ing1.text = ingredientes[0]
            ing1.textColor = UIColor.blackColor()
        } else {
            ing1.text = "N/D"
            ing1.textColor = UIColor.redColor()
        }
        
        if ingNum > 1 {
            ing2.text = ingredientes[1]
        } else {
            ing2.text = ""
        }
        
        if ingNum > 2 {
            ing3.text = ingredientes[2]
        } else {
            ing3.text = ""
        }
        
        if ingNum > 3 {
            ing4.text = ingredientes[3]
        } else {
            ing4.text = ""
        }
        
        if ingNum > 4 {
            ing5.text = ingredientes[4]
        } else {
            ing5.text = ""
        }
        
    }
    
    func probando() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        if identifier == "confirmar" {
            
            if tamaño == "" || masa == "" || queso == "" || ingredientes.count<1 {
                
                var flag = true
                
                if tamaño == "" {
                    flag = false
                    let alert = UIAlertController(title: "Oops!", message:"cancelando, falta tamaño.", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "OK", style: .Default) { _ in
                        self.performSegueWithIdentifier("size", sender:  nil)
                    }
                    alert.addAction(action)
                    self.presentViewController(alert, animated: true){}
                }
                
                if masa == "" && flag {
                    flag = false
                    let alert = UIAlertController(title: "Oops!", message:"cancelando, falta masa.", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "OK", style: .Default) { _ in
                        self.performSegueWithIdentifier("mass", sender: nil)
                    }
                    alert.addAction(action)
                    self.presentViewController(alert, animated: true){}
                }
                
                if queso == "" && flag {
                    flag = false
                    let alert = UIAlertController(title: "Oops!", message:"cancelando, falta queso.", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "OK", style: .Default) { _ in
                        self.performSegueWithIdentifier("cheese", sender: nil)
                    }
                    alert.addAction(action)
                    self.presentViewController(alert, animated: true){}
                }
                
                if ingredientes.count < 1 && flag {
                    let alert = UIAlertController(title: "Oops!", message:"cancelando, faltan ingredientes.", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "OK", style: .Default) { _ in
                        self.navigationController?.popViewControllerAnimated(true)
                    }
                    alert.addAction(action)
                    self.presentViewController(alert, animated: true){}
                }
                
                print("cancelando, faltan componentes")
                return false
            } else {
                return true
            }
        }
        
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "size" {
            let sc = segue.destinationViewController as! SizeController
            sc.masa = masa
            sc.queso = queso
            sc.ingredientes = ingredientes
        }
        
        if segue.identifier == "mass" {
            let mc = segue.destinationViewController as! MassController
            mc.tamaño = tamaño
            mc.masa = masa
            mc.queso = queso
            mc.ingredientes = ingredientes
        }
        
        if segue.identifier == "cheese" {
            let cc = segue.destinationViewController as! CheeseController
            cc.tamaño = tamaño
            cc.masa = masa
            cc.queso = queso
            cc.ingredientes = ingredientes
        }
        
        if segue.identifier == "ingredients" {
            let ic = segue.destinationViewController as! IngredientsController
            ic.tamaño = tamaño
            ic.masa = masa
            ic.queso = queso
            ic.ingredientes = ingredientes
        }
    }
    
}