//
//  AlertHelper.swift
//  comera
//
//  Created by Mac on 28/03/24.
//

import Foundation
import UIKit
class AlertHelper {
    
    static func showAlert(on viewController: UIViewController, title: String, message: String, duration: Double = 2.0) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Set background color to red
        if let view = alert.view {
            view.backgroundColor = UIColor.red
            view.layer.cornerRadius = 20
            
        }
        
        viewController.present(alert, animated: true, completion: nil)
        
        // Dismiss alert after specified duration
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
