//
//  servicesVC.swift
//  comera
//
//  Created by Mac on 14/03/24.
//

import UIKit

class servicesVC: UIViewController {
    @IBOutlet weak var backBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    func setup(){
        self.backBtn.roundCorner()
        backBtn.layer.borderWidth = 1
        backBtn.layer.borderColor = UIColor.black.cgColor
        self.navigationController?.isNavigationBarHidden = true

    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }

}
