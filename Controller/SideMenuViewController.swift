//
//  SideMenuViewController.swift
//  comera
//
//  Created by Mac on 22/03/24.
//

import UIKit

class SideMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Add your side menu items or other UI elements here
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 200, height: 30))
        label.text = "Side Menu"
        view.addSubview(label)
    }
}
