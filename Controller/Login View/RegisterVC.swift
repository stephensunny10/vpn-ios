//
//  RegisterVC.swift
//  comera
//
//  Created by Mac on 14/03/24.
//

import UIKit
import Alamofire
import SVProgressHUD


class RegisterVC: UIViewController {
    @IBOutlet weak var gmailview: UIView!
    
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var nameTextFeild: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var nameView: UIView!


    @IBOutlet weak var upsignview: UIView!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var signUpview: UIView!
    @IBOutlet weak var signUpbtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    func setup(){
        self.signupBtn.roundCorner()
        self.signUpview.roundCorner()
        self.signUpbtn.roundCorner()
        self.upsignview.roundCorner()
        self.backBtn.roundCorner()
        backBtn.layer.borderWidth = 1
        backBtn.layer.borderColor = UIColor.black.cgColor
        self.gmailview.roundCornerWithBorder(borderColor: .gray)
        self.passwordView.roundCornerWithBorder(borderColor: .gray)
        self.nameView.roundCornerWithBorder(borderColor: .gray)
        

    


    }

    @IBAction func signinBtn(_ sender: Any) {
        let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "signINVC") as! signINVC
        self.navigationController!.pushViewController(thirdViewController, animated: true)
    }
    
    @IBAction func signbtn(_ sender: Any) {

        guard let email = nameTextFeild.text, !email.isEmpty else {
            AlertHelper.showAlert(on: self, title: "", message: "Please Enter email")
            return
        }
        guard let password = emailTextFeild.text, !password.isEmpty else {
            AlertHelper.showAlert(on: self, title: "", message: "Please Enter password")
            return
        }
        guard let password = passwordTextFeild.text, !password.isEmpty else {
            AlertHelper.showAlert(on: self, title: "", message: "Please Enter password")
            return
        }

        // Show loader
        SVProgressHUD.show()

        RegisterVC.registerUser(firstName: nameTextFeild.text!, lastName: "-", email: emailTextFeild.text!, password: passwordTextFeild.text!) { result in
            switch result {
            case .success(let message):
                print("Registration successful: \(message)")
                UserDefaults.standard.set(email, forKey: USERDEFAULTS_KEY.Email)
                UserDefaults.standard.set(password, forKey: USERDEFAULTS_KEY.Password)
                UserDefaults.standard.set(true, forKey: "isLoggedIn")

                // Hide loader
                SVProgressHUD.dismiss()

                let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "dashBoardVC") as! dashBoardVC
                self.navigationController!.pushViewController(thirdViewController, animated: true)

            case .failure(let error):
                AlertHelper.showAlert(on: self, title: "", message: "Registration failed")

                print("Registration failed: \(error.localizedDescription)")

                // Hide loader
                SVProgressHUD.dismiss()
            }
        }
    }
    
    

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    
   

   


    
    
        static func registerUser(firstName: String, lastName: String?, email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {

            let parameters: [String: Any] = [
                "first_name": firstName,
                "last_name": lastName as Any,
                "email": email,
                "password": password
            ]

            AF.request(APIEndPoints.register, method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .validate()
                .responseJSON { response in

                    switch response.result {

                    case .success(let value):
                        if let jsonResponse = value as? [String: Any],
                           let message = jsonResponse["message"] as? String {
                            completion(.success(message))
                        } else {
                            completion(.failure(NSError(domain: "Invalid response format", code: -1, userInfo: nil)))
                        }

                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }


    
}
