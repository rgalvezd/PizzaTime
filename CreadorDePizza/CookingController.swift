//
//  CookingController.swift
//  CreadorDePizza
//
//  Created by Rodrigo Gálvez Díaz on 13/12/15.
//  Copyright © 2015 SwiftProgramariOS. All rights reserved.
//

import UIKit

class CookingController: UIViewController {
    
    @IBOutlet weak var mensaje: UILabel!
    @IBOutlet weak var btnReinicio: UIButton!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.inOven()
        }
    }
    
    private func inOven(){
        mensaje.text = "Su pedido esta en el horno, ¿nota como empieza a oler?"
        mensaje.textColor = UIColor.redColor()
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.inDelivery()
        }
    }
    
    private func inDelivery() {
        mensaje.text = "Su pedido esta en reparto, ya casi puede tocarlo"
        mensaje.textColor = UIColor.orangeColor()
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.finishOrder()
        }
    }
    
    private func finishOrder() {
        mensaje.text = "Su pedido ha sido entregado, gracias por confiar en nosotros y que lo disfrute"
        mensaje.textColor = UIColor.blueColor()
        activity.stopAnimating()
        btnReinicio.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}