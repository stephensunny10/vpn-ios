//
//  editProfileVC.swift
//  comera
//
//  Created by Mac on 18/03/24.
//

import UIKit

class editProfileVC: UIViewController {

    @IBOutlet weak var savebtn: UIView!
    @IBOutlet weak var saveview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    func setup(){
    self.savebtn.roundCorner()
    self.saveview.roundCorner()
    self.navigationController?.isNavigationBarHidden = true
    }
   

}
