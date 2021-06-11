//
//  FirstViewController.swift
//  Color Matching
//
//  Created by Oleg Tsarenkoff on 4.06.21.
//

import UIKit

protocol SecondViewControllerDelegate {
    func outputColor(_ color: UIColor)
}

class FirstViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.delegate = self
        secondVC.userColor = view.backgroundColor
        
    }
}

// MARK: - ColorDelegate
extension FirstViewController: SecondViewControllerDelegate {
    func outputColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
