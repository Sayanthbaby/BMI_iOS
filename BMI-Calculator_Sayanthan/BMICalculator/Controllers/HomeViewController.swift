//
//  ViewController.swift
//  BMICalculator
//
//  Created by Sriskandarajah Sayanthan 301279325
// 


import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet var bmiLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!
    @IBOutlet var calculateBtn: UIButton!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    @IBOutlet var stackviewBottomConstraint: NSLayoutConstraint!
    var height: Float!
    var weight: Float!
    
    
    
    //MARK: - Variables
    var bmiCalculator = BMICalculator()
    
    
    //MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        //stackviewBottomConstraint.constant = 10
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
        updateSliderValue()
    }
    
    func updateSliderValue() {
        heightSlider.value = height
        weightSlider.value = weight
        let heightValue = String(format: "%.2f", height)
        self.heightLabel.text = heightValue + "m"
        let weightValue = String(format: "%.0f", weight)
        self.weightLabel.text = weightValue + "Kg"
    }
    
    //MARK: - Functions
    @IBAction func calculatePressed(_ sender: UIButton) {
        bmiCalculator.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func heightChanged(_ sender: UISlider) {
        let heightValue = String(format: "%.2f", sender.value)
        self.heightLabel.text = heightValue + "m"
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        let weightValue = String(format: "%.0f", sender.value)
        self.weightLabel.text = weightValue + "Kg"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.bmiValue = bmiCalculator.getBMIValue()
            resultVC.bmiColor = bmiCalculator.getColor()
            resultVC.advice = bmiCalculator.getAdvice()
        }
    }
    
    private func layout() {
        // not writing the iphone 6, 6s, 7 on purpose
        if UIDevice.modelName == "iPhone 8" || UIDevice.modelName == "Simulator iPhone 8" || UIDevice.modelName == "iPhone 8 Plus" || UIDevice.modelName == "Simulator iPhone 8 Plus" {
            
        }
        else {
            print("Device not found")
        }
    }
    
}


