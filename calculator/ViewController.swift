//
//  ViewController.swift
//  calculator
//
//  Created by Abishek on 9/25/17.
//  Copyright © 2017 Abishek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var prevNumber:Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true{
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        
        else {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            prevNumber = Double(label.text!)!;
            
            if sender.tag == 12 {
                //Divide
                label.text = "/"
            }
            else if sender.tag == 13 {
                //Multiply
                label.text = "X"
            }
            else if sender.tag == 14 {
                //Subtract
                label.text = "-"
            }
            else if sender.tag == 15 {
                //Addition
                label.text = "+"
            }
            
            operation = sender.tag
            performingMath = true
        }
            
        else if sender.tag == 16{
            if operation == 12 {
                label.text = String(prevNumber / numberOnScreen)
            }
                
            else if operation == 13 {
                label.text = String(prevNumber * numberOnScreen)
            }
                
            else if operation == 14 {
                label.text = String(prevNumber - numberOnScreen)
            }
                
            else if operation == 15 {
                label.text = String(prevNumber + numberOnScreen)
            }
        }
            
        else if sender.tag == 11 {
            
            label.text = ""
            numberOnScreen = 0
            prevNumber = 0
            operation = 0
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

