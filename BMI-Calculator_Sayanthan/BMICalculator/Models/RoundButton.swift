//
//  RoundButton.swift
//  BMICalculator
//  @author Sriskandarajah Sayanthan
// Student id: 301279325


import UIKit

@IBDesignable
open class RoundButton: UIButton {
 
    // define some functions
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
}
