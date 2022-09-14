//
//  ViewController.swift
//  CSE438-HannaFu-Lab1
//
//  Created by Sproull Student on 9/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var originalPrice: UITextField!
    
    @IBOutlet weak var discount: UITextField!
    
    @IBOutlet weak var tax: UITextField!
    
    @IBOutlet weak var finalPrice: UILabel!
        
    @IBOutlet weak var itemName: UITextField!
    
    @IBOutlet weak var itemPrice: UITextField!
    
    @IBOutlet weak var finalItemPrice: UILabel!
    
    @IBOutlet weak var maxItemName: UILabel!
    
    @IBOutlet weak var maxItemVal: UILabel!
    
    //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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("check")
    }

    @IBAction func updatePriceText(_ sender: Any) {
        updateFinal()
    }
    @IBAction func updateDiscountText(_ sender: Any) {
        updateFinal()
    }
    
    @IBAction func updateTaxtText(_ sender: Any) {
        updateFinal()
    }
    
    @IBAction func itemCalculation(_ sender: Any) {
        updateFinal()
    }
    
    var addedItemDouble = 0.0
    var itemNames = [String]()
    var itemPrices = [String]()
    //var maxItemName = ""
    var maxItemPrice = 0.0
    
    func updateFinal() {
        
        var priceDouble = 0.0
        var discountDouble = 0.0
        var taxDouble = 0.0
        var itemPrice_ = 0.0
        
        
        if (itemName.text != nil && itemPrice.text != nil) {
            itemNames.append(toString(input: itemName.text))
            itemPrices.append(toString(input: itemPrice.text))
            itemPrice_ = Double(itemPrice.text!) ?? 0.0
            //check if max
            if itemPrice_ > maxItemPrice {
                maxItemPrice = itemPrice_
                maxItemName.text = itemName.text
                maxItemVal.text = itemPrice.text
            }
            //added item price to global value
            addedItemDouble += itemPrice_
            itemName.text = ""
            itemPrice.text = ""
        }
        
        //immediately shows the price
        if originalPrice.text != nil {
            finalPrice.text = originalPrice.text;
            priceDouble = Double(originalPrice.text!) ?? 0.0
        }
        
        
        
        if discount.text != nil {
            discountDouble = Double(discount.text!) ?? 1.0
        }
        
        if tax.text != nil {
            taxDouble = Double(tax.text!) ?? 1.0
        }
        
        
        priceDouble += addedItemDouble
        priceDouble = priceDouble * (1.0 - percent(input: discountDouble));
        priceDouble = priceDouble * (1.0 + percent(input:taxDouble));
        
        finalPrice.text =  String(format: "%.2f", priceDouble);
        finalItemPrice.text =  String(format: "%.2f", addedItemDouble);
        
        
        
    }
    
    func percent(input: Double) -> Double {
        if input == 1.0 { //if there's nothing inputted
            return 0.0
        }
        else {
        
            return input/100;
        }
    }
    
    func toString(input: String?) -> String {
            var output = ""
            if (input != nil) {
                output = String(input!)
            }
            return output
        }

}

