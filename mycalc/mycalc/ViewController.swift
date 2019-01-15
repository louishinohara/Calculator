//
//  ViewController.swift
//  mycalc
//
//  Created by Louis Shinohara on 1/13/19.
//  Copyright © 2019 Louis Shinohara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var inputVal = String()                 // Stores the user input as a string to to converted into a integer.
    var operation = Int()
    var index = 0                           // index which will be used for the array
    var val = [0.0 , 0.0]                   // This array will store the values to be operated on
    var total = 0                     // Calculation won't be displayed until atleast 1 operation is completed
    var signn = false                         // Sign is on or off
    override func viewDidLoad() {           // Initial display
        super.viewDidLoad()
        display.text = " "                  // Display nothing in the label when the app loads
    }
    
    @IBOutlet weak var display: UILabel!    // Label
    
// Operators
    @IBAction func add(_ sender: Any) {
        
        calc()
        operation = 1
    }
    @IBAction func subtract(_ sender: Any) {
        calc()
        operation = 2
    }
    @IBAction func multiply(_ sender: Any) {
        calc()
        operation = 3
    }
    @IBAction func divide(_ sender: Any) {
        calc()
        operation = 4
    }
    @IBAction func equal(_ sender: Any) {   // After equal sign is pressed. There is no operation chosen. So any operation picked after is an error.
        calc()
        operation = 0                       // i dunno why but this made it work. 
        
    }
    
// Clear
    @IBAction func clear(_ sender: Any) {       // Resets all values
        operation = 0
        inputVal = String()
        index = 0
        val = [0.0 , 0.0]
        display.text = " "
    }
       
// Decimal
    @IBAction func decimal(_ sender: Any) {
        inputVal += "."
        display.text = inputVal
    }
    
// Numbers
    @IBAction func zero(_ sender: Any) {
       inputVal += "0"
       display.text = inputVal
    }
    @IBAction func one(_ sender: Any) {
        inputVal += "1"
        display.text = inputVal
    }
    @IBAction func two(_ sender: Any) {
        inputVal += "2"
        display.text = inputVal
    }
    @IBAction func three(_ sender: Any) {
        inputVal += "3"
        display.text = inputVal
    }
    @IBAction func four(_ sender: Any) {
        inputVal += "4"
        display.text = inputVal
    }
    @IBAction func five(_ sender: Any) {
        inputVal += "5"
        display.text = inputVal
    }
    @IBAction func six(_ sender: Any) {
        inputVal += "6"
        display.text = inputVal
    }
    @IBAction func seven(_ sender: Any) {
        inputVal += "7"
        display.text = inputVal
    }
    @IBAction func eight(_ sender: Any) {
        inputVal += "8"
        display.text = inputVal
    }
    @IBAction func nine(_ sender: Any) {
        inputVal += "9"
        display.text = inputVal
    }
    
func calc() {                                   // The function that carries out the calculations.
    let num = Double(inputVal) ?? 0             // Takes the UI String and converts it into a double
    if index == 0 {                             //
            val[0] = num
            index = 1
    }
    else if index == 1 {                        // Since the first value has been stored, the second value will take on an operation
        val[1] = num
    switch operation {
        case 1:
            let sum = val[0] + val[1]
            val[0] = sum                        // Stores the sum as the first value. Since the index will always be 1, index 0 will remain untouched              thus it is a good place to store the total value.
        case 2:
            let dif = val[0] - val[1]
            val[0] = dif
        case 3:
            let prod = val[0] * val[1]
            val[0] = prod
        case 4:
            let div = val[0] / val[1]
            val[0] = div
        default:
            print("Error")
        }
    }

        display.text = String(val[0])           // Displays the total value after 1 operation is complete
    inputVal = String()                          // Resets the input value
}
}

