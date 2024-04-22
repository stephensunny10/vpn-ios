//
//  thirdVC.swift
//  comera
//
//  Created by Mac on 14/03/24.
//

import UIKit

class thirdVC: UIViewController {
   
    let myColor : UIColor = UIColor( red:0.0/255 , green:201.0/255, blue:222.0/255, alpha: 1.0 )

    @IBOutlet weak var skipView: UIView!
    
    @IBOutlet weak var skipbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
    
    func setup(){
   
        self.skipbtn.roundCorner()
        skipbtn.layer.borderWidth = 1
        skipbtn.layer.borderColor = myColor.cgColor
        self.skipView.roundCorner()
        skipView.layer.borderWidth = 1
        skipView.layer.borderColor = myColor.cgColor
    }
    
    @IBAction func skipButton(_ sender: Any) {
        let secondVC = self.storyboard!.instantiateViewController(withIdentifier: "signINVC") as! signINVC
        self.navigationController!.pushViewController(secondVC, animated: true)
        print("Skip")

    }
}
