//
//  IngredientsController.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 13/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import UIKit

protocol IngredientsControllerDelegate{
    
}

class IngredientsController: UITableViewController {
    
    var delegate:IngredientsControllerDelegate? = nil
    
    internal var tamaño:String?
    internal var masa:String?
    internal var queso: String?
    internal var ingredientes:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if ingredientes.count > 0{
            for (var row = 0; row < tableView.numberOfRowsInSection(0); row++) {
                tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: false)
                
                let cell:UITableViewCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0))!
                
                var i = 0
                var flag = false
                repeat {
                    if cell.textLabel?.text == ingredientes[i]{
                        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                        flag = true
                    }
                    i++
                }while(i < ingredientes.count && !flag)
                
               tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: false)
                
                // do something with the cell here.
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!
        
        if cell.accessoryType != UITableViewCellAccessoryType.Checkmark {
            if ingredientes.count < 5 {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                ingredientes.append(cell.textLabel?.text as String!)
            } else {
                let alert = UIAlertController(title: "Oops!", message:"Ya has elegido 5 ingredientes, elimina uno antes de poder elegir otro.", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default) { _ in }
                alert.addAction(action)
                self.presentViewController(alert, animated: true){}
            }
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
            ingredientes.removeAtIndex(ingredientes.indexOf(cell.textLabel?.text as String!)!)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let chc = segue.destinationViewController as! ConfirmController
        chc.tamaño = tamaño
        chc.masa = masa
        chc.queso =  queso
        chc.ingredientes = ingredientes
    }
    
    @IBAction func unwindForIngredients(segue:UIStoryboardSegue){ }
    
    func updateData(tamaño tamaño: String, masa: String, queso: String, ingredientes: Array<String>) {
        self.tamaño = tamaño
        self.masa = masa
        self.queso = queso
        self.ingredientes = ingredientes
    }
}
