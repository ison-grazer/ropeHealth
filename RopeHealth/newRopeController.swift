//
//  newRopeController.swift
//  ropeHealth
//
//  Created by Isabella Fransson on 2019-07-17.
//  Copyright © 2019 Isabella Fransson. All rights reserved.
//

import UIKit

class newRopeController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var buttonContainer: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var enterNameField: UITextField!
    @IBOutlet weak var dateOfFstUse: UITextField!  //prompts date-picker
    
    
    @IBOutlet weak var lenghtSlider: UISlider!
    @IBOutlet weak var lenghtPrintBox: UITextField!
    
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var widthPrintBox: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var footer: UIImageView!
    
    @IBAction func lengthSliderChanged(_ sender: UISlider) { //in m
        let currentValue = Int(sender.value)
        lenghtPrintBox.text = "\(currentValue)"
    }
    
    @IBAction func widthSliderChanger(_ sender: UISlider) { //in mm
        let currentValue = Double(sender.value)
        let decValue = convertDecimals(num: currentValue)
        widthPrintBox.text = "\(decValue)"
    }
    
    func convertDecimals (num: Double) -> Double {
        let x = Double(Int(num*10))/10
        return x
    }
    
    lazy var datePicker: UIDatePicker = {
        
        let picker = UIDatePicker() //instance of datePicker
        
        picker.datePickerMode = .date //not time
        
        picker.addTarget(self, action: #selector(datePickerChanged( _:)), for: .valueChanged) //will execute the method
        
        return picker
    }()
    
    lazy var dateFormatter: DateFormatter = {
       
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
            
        return formatter //smthng is off
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonContainer.layer.cornerRadius = 20 //rounds corners

        dateOfFstUse.inputView = datePicker //when interacting with bar
        // Do any additional setup after loading the view.
    }
    
    @objc func datePickerChanged(_ sender: UIDatePicker){   //creates a string from the data from method
        dateOfFstUse.text = dateFormatter.string(from: sender.date)
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){ //when tapping outside the field it closes
      view.endEditing(true)
    }
    @IBAction func doneBtn(_ sender: UIButton) {
        //will store data, show entry ok/edit then send to main page or "edit existing"
    }
}



