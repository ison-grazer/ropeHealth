//
//  updateRopeController.swift
//  ropeHealth
//
//  Created by Isabella Fransson on 2019-07-19.
//  Copyright © 2019 Isabella Fransson. All rights reserved.
//

import UIKit
import CoreData

class updateRopeController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var buttonContainer: UIImageView!
    @IBOutlet weak var climbingSelector: UITextField!
    @IBOutlet weak var terrainSelector: UITextField!
    @IBOutlet weak var dateSelector: UITextField!
    
    //create arrays before the view loads
    var climbingOptions = ["Top rope", "Sport", "Trad" ]
    var terrainOptions = ["Rock", "Sand", "Dirt", "Grass", "Dust", "Gravel"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonContainer.layer.cornerRadius = 20 //rounds corners
        //terrain-picker
        let terrainPickerView = UIPickerView()
        terrainPickerView.delegate = self
        terrainPickerView.tag = 1
        terrainSelector.inputView = terrainPickerView
        //climbing-picker
        let climbingPickerView = UIPickerView()
        climbingPickerView.delegate = self
        climbingPickerView.tag = 2
        climbingSelector.inputView = climbingPickerView
        
        
        dateSelector.inputView = datePicker

        // Do any additional setup after loading the view.
    }
   
    ////////////for the picker
   
   //Number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return terrainOptions.count
        }
        
        if pickerView.tag == 2 {
            return climbingOptions.count
        }
       
        return 0 //nothing
    }
    
    //Title for each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            return terrainOptions[row]
        }
        
        if pickerView.tag == 2 {
            return climbingOptions[row]
        }
        
        return nil  //nothing as a string
    }
    
    //Puts selected into the textfield
    func pickerView(_ pickerView: UIPickerView, didSelectRow selected: Int, inComponent comp: Int) {
        
        if pickerView.tag == 1 {
            return terrainSelector.text = terrainOptions[selected]
        }
        
        if pickerView.tag == 2 {
            return climbingSelector.text = climbingOptions[selected]
            
        }
        
        //return nil
    }
    
    ///////////////end of picker
    
    
    ////////    for date picker
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
    
    @objc func datePickerChanged(_ sender: UIDatePicker){   //creates a string from the data from method
        dateSelector.text = dateFormatter.string(from: sender.date)
    }
    //end of date-picker
    
    
    @IBAction func terrainSelector(_ sender: Any) {
        //scrollbar with possibility to add custom terrain
    }
    
    @IBAction func fallSwitch(_ sender: Any) {
        //registers heavu fall, triggers retire-message
    }
    @IBAction func doneBtn(_ sender: Any) {
        //updates/adds info
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){ //when tapping outside the field it closes
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
