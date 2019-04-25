//
//  ViewController.swift
//  BMICalculator
//
//  Created by Vebby Clarissa on 24/04/19.
//  Copyright © 2019 Vebby Clarissa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelBMI: UILabel!
    
    
    @IBOutlet weak var labelHeightValue: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var labelWeightValue: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var labelBMIvalue: UILabel!
    @IBOutlet weak var labelBodyStatus: UILabel!
    
    @IBOutlet weak var segmMode: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBMI(weight: weightSlider.value, height: heightSlider.value)
        // Do any additional setup after loading the view.
    }
    
    func updateBMI(weight:Float , height : Float) {
        
        let value =  weight / (height*height)
        labelBMIvalue.text = String (format: "%.1f", value) //update label BMI (kg.m2)
        changeBodyStatus(bmiValue: value) //update normal/overweight/underweight/obese
    }
    
    func changeBodyStatus (bmiValue : Float){
        switch bmiValue {
        case ...18.5:
            labelBodyStatus.text = "Underweight"
            labelBodyStatus.textColor = #colorLiteral(red: 0.2982997894, green: 0.2822205424, blue: 0.9348832965, alpha: 1)
        case 18.5...25:
            labelBodyStatus.text = "Normal"
            labelBodyStatus.textColor = #colorLiteral(red: 0, green: 0.913634479, blue: 0, alpha: 1)
        case 25...30:
            labelBodyStatus.text = "Overweight"
            labelBodyStatus.textColor = #colorLiteral(red: 0.9683964849, green: 0.3945158124, blue: 0, alpha: 1)
        default:
            labelBodyStatus.text = "Obese"
            labelBodyStatus.textColor = #colorLiteral(red: 0.9836563468, green: 0, blue: 0, alpha: 1)
        }
    }

    @IBAction func sliderWeightMoved(_ sender: Any) {
        // Action jika slider weight dipindahkan
        let value = weightSlider.value
        labelWeightValue.text = "\(String(format: "%.1f", value)) kg"
        updateBMI(weight: weightSlider.value, height: heightSlider.value)
    }
    
    @IBAction func sliderHeightMoved(_ sender: Any) {
        let value = heightSlider.value
        labelHeightValue.text = "\(String(format: "%.1f", value)) m"
        updateBMI(weight: weightSlider.value, height: heightSlider.value)
    }
    
    //setting night mode
    @IBAction func changeMode(_ sender: Any) {
        //ganti ke mode malam dan sebaliknya
        if segmMode.selectedSegmentIndex == 1{
            view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            labelBodyStatus.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            labelBMI.textColor = UIColor.white
            labelTitle.textColor = UIColor.white
            labelHeight.textColor = UIColor.white
            labelWeight.textColor = UIColor.white
            labelBMIvalue.textColor = UIColor.white
            labelHeightValue.textColor = UIColor.white
            labelWeightValue.textColor = UIColor.white
        }
        else {
            view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            labelBodyStatus.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            labelBMI.textColor = UIColor.black
            labelTitle.textColor = UIColor.black
            labelHeight.textColor = UIColor.black
            labelWeight.textColor = UIColor.black
            labelBMIvalue.textColor = UIColor.black
            labelHeightValue.textColor = UIColor.black
            labelWeightValue.textColor = UIColor.black
        }
    }
}

