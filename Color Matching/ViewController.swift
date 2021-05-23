//
//  ViewController.swift
//  Color Matching
//
//  Created by Олег on 22.05.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outputUsersColor: UIView!
    @IBOutlet weak var outputTextColor: UILabel!
    
    @IBOutlet weak var alphaCounter: UILabel!
    @IBOutlet weak var redCounter: UILabel!
    @IBOutlet weak var greenCounter: UILabel!
    @IBOutlet weak var blueCounter: UILabel!
    
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    private func outputColor() {
        
        let alphaColorCurrent = String(format: "%.2f", alphaSlider.value)
        alphaCounter.text = alphaColorCurrent
        let redColorCurrent = String(format: "%.2f", redSlider.value)
        redCounter.text = redColorCurrent
        let greenColorCurrent = String(format: "%.2f", greenSlider.value)
        greenCounter.text = greenColorCurrent
        let blueColorCurrent = String(format: "%.2f", blueSlider.value)
        blueCounter.text = blueColorCurrent
        
        outputUsersColor.backgroundColor = .init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(alphaSlider.value))
        
        //Тут уже пошла импровизация :)
        let newRedCount = String(format: "%.f", redSlider.value * 255)
        let newGreenCount = String(format: "%.f", greenSlider.value * 255)
        let newBlueCount = String(format: "%.f", blueSlider.value * 255)
        
        outputTextColor.text = .init("R: \(newRedCount) \nG: \(newGreenCount) \nB: \(newBlueCount)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputUsersColor.layer.cornerRadius = 20
        outputColor()
        
    }
    
    @IBAction func alphaSlide() {
        outputColor()
    }
    @IBAction func redSlide() {
        outputColor()
    }
    @IBAction func greenSlide() {
        outputColor()
    }
    @IBAction func blueSlide() {
        outputColor()
    }
    
    
}

