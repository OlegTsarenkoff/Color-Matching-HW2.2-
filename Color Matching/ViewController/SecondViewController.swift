//
//  ViewController.swift
//  Color Matching
//
//  Created by Oleg Tsarenkoff on 22.05.21.
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
    
    //MARK: - Public properties
    var userColor: UIColor!
    var delegate: SecondViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputUsersColor.layer.cornerRadius = 20
        outputUsersColor.backgroundColor = userColor
        
        setSliders()
        setValue(for: redTF, greenTF, blueTF, alphaTF)
    }
    
    //MARK: - IBAction
    @IBAction func rgbaSlider() {
        setValue(for: redTF, greenTF, blueTF, alphaTF)
        outputColor()
    }
}

//MARK: - Private func
extension SecondViewController {
    
    private func outputColor() {
        outputUsersColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(alphaSlider.value)
        )
        
        delegate?.outputColor(outputUsersColor.backgroundColor ?? .white)
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTF: textField.text = string(from: redSlider)
            case greenTF: textField.text = string(from: greenSlider)
            case blueTF: textField.text = string(from: blueSlider)
            default: textField.text = string(from: alphaSlider)
            }
        }
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: userColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @objc private func doneClicked() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension SecondViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        doneClicked()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTF:
                redSlider.setValue(currentValue, animated: true)
            case greenTF:
                greenSlider.setValue(currentValue, animated: true)
            case blueTF:
                blueSlider.setValue(currentValue, animated: true)
            default:
                alphaSlider.setValue(currentValue, animated: true)
            }
            outputColor()
            return
        }
        showAlert(title: "Wrong format!", message: "Please enter correct value")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneClicked)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
