//
//  ViewController.swift
//  Color Matching
//
//  Created by Олег on 22.05.21.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var outputUsersColor: UIView!
    
    @IBOutlet weak var alphaTF: UITextField!
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var activeTextField: UITextField? = nil
    
    //MARK: - Public func
    override func viewDidLoad() {
        super.viewDidLoad()
        outputUsersColor.layer.cornerRadius = 20
        outputColor()
        setValue(for: redTF, greenTF, blueTF, alphaTF)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - IBAction
    @IBAction func rgbaSlider() {
        outputColor()
        setValue(for: redTF, greenTF, blueTF, alphaTF)
    }
    
    //MARK: - Private func
    private func outputColor() {
        outputUsersColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(alphaSlider.value))
    }
    
    private func setValue(for labels: UITextField...) {
        labels.forEach { label in
            switch label {
            case redTF :
                label.text = string(from: redSlider)
            case greenTF :
                label.text = string(from: greenSlider)
            case blueTF :
                label.text = string(from: blueSlider)
            case alphaTF :
                label.text = string(from: alphaSlider)
            default:
                break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
