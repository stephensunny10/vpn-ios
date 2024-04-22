//
//  extensionUIView.swift
//  comera
//
//  Created by Mac on 14/03/24.
//


import Foundation
import UIKit
extension UIView {
    
    func roundCorner(){
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    func roundCornerWithBorder(borderColor:UIColor){
//        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = 0.5
        self.layer.borderColor = borderColor.cgColor
    }
   
}
