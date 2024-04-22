//
//  firstVC.swift
//  comera
//
//  Created by Mac on 14/03/24.
//

//import UIKit
//
//class firstVC: UIViewController {
//
//    @IBOutlet weak var skipBtn: UIButton!
//    @IBOutlet weak var skipView: UIView!
//    @IBOutlet weak var nxtBtn: UIButton!
//    @IBOutlet weak var nextView: UIView!
//    let myColor : UIColor = UIColor( red:0.0/255 , green:201.0/255, blue:222.0/255, alpha: 1.0 )
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//
//        // Do any additional setup after loading the view.
//    }
//    func setup(){
//        self.navigationController?.isNavigationBarHidden = true
//
//        self.nxtBtn.roundCorner()
//        self.nextView.roundCorner()
//        self.skipBtn.roundCorner()
//        skipBtn.layer.borderWidth = 1
//        skipBtn.layer.borderColor = myColor.cgColor
//        self.skipView.roundCorner()
//        skipView.layer.borderWidth = 1
//        skipView.layer.borderColor = myColor.cgColor
//
//
//
//
//    }
//
//    @IBAction func nextButton(_ sender: Any) {
//        let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "SEcondVC") as! SEcondVC
//        self.navigationController!.pushViewController(secondViewController, animated: true)
//        print("next")
//    }
//    @IBAction func skipButton(_ sender: Any) {
//        let secondVC = self.storyboard!.instantiateViewController(withIdentifier: "signINVC") as! signINVC
//        self.navigationController!.pushViewController(secondVC, animated: true)
//        print("Skip")
//
//    }
//    /*
//
//     // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
import UIKit

class firstVC: UIViewController {

    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var skipView: UIView!
    @IBOutlet weak var nxtBtn: UIButton!
    @IBOutlet weak var nextView: UIView!
    let myColor: UIColor = UIColor(red: 0.0/255, green: 201.0/255, blue: 222.0/255, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Check if user is already logged in
        if isUserLoggedIn() {
            navigateToDashboard()
        }
    }

    func setup() {
        self.navigationController?.isNavigationBarHidden = true

        self.nxtBtn.roundCorner()
        self.nextView.roundCorner()
        self.skipBtn.roundCorner()
        skipBtn.layer.borderWidth = 1
        skipBtn.layer.borderColor = myColor.cgColor
        self.skipView.roundCorner()
        skipView.layer.borderWidth = 1
        skipView.layer.borderColor = myColor.cgColor
    }

    func isUserLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }

    func navigateToDashboard() {
        let dashboardVC = self.storyboard!.instantiateViewController(withIdentifier: "dashBoardVC") as! dashBoardVC
        self.navigationController!.pushViewController(dashboardVC, animated: false)
    }

    @IBAction func nextButton(_ sender: Any) {
        let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "SEcondVC") as! SEcondVC
        self.navigationController!.pushViewController(secondViewController, animated: true)
        print("next")
    }

    @IBAction func skipButton(_ sender: Any) {
        let secondVC = self.storyboard!.instantiateViewController(withIdentifier: "signINVC") as! signINVC
        self.navigationController!.pushViewController(secondVC, animated: true)
        print("Skip")
    }
}
