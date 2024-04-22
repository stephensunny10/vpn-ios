//
//  signINVC.swift
//  comera
//
//  Created by Mac on 14/03/24.


//
//import UIKit
//import Alamofire
//import SVProgressHUD
//
//class signINVC: UIViewController {
//
//    @IBOutlet weak var gmailview: UIView!
//    @IBOutlet weak var passwordTF: UITextField!
//    @IBOutlet weak var emailTF: UITextField!
//    @IBOutlet weak var passwordView: UIView!
//    @IBOutlet weak var signin: UIButton!
//    @IBOutlet weak var signinbtnview: UIView!
//    @IBOutlet weak var backBtn: UIButton!
//    @IBOutlet weak var signInBtn: UIButton!
//    @IBOutlet weak var signView: UIView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//    }
//
//    func setup() {
//        self.signin.roundCorner()
//        self.signinbtnview.roundCorner()
//        self.signInBtn.roundCorner()
//        self.signView.roundCorner()
//        self.backBtn.roundCorner()
//        self.gmailview.roundCornerWithBorder(borderColor: .gray)
//        self.passwordView.roundCornerWithBorder(borderColor: .gray)
//        self.backBtn.roundCorner()
//        backBtn.layer.borderWidth = 1
//        backBtn.layer.borderColor = UIColor.black.cgColor
//    }
//
//    @IBAction func signUpBtn(_ sender: Any) {
//        let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
//        self.navigationController!.pushViewController(thirdViewController, animated: true)
//    }
//
//    @IBAction func sigbbtn(_ sender: Any) {
//        guard let email = emailTF.text, !email.isEmpty else {
//            AlertHelper.showAlert(on: self, title: "", message: "Please Enter email")
//            return
//        }
//        guard let password = passwordTF.text, !password.isEmpty else {
//            AlertHelper.showAlert(on: self, title: "", message: "Please Enter password")
//            return
//        }
//        SVProgressHUD.show()
//
//        loginUser(email: email, password: password) { result in
//            switch result {
//            case .success(let userResponse):
//                if userResponse.success {
//                    print("Login success!")
////                    SVProgressHUD.dismiss()
//
//                    // Save email to UserDefaults
//                    UserDefaults.standard.set(email, forKey: USERDEFAULTS_KEY.Email)
//                    UserDefaults.standard.set(password, forKey: USERDEFAULTS_KEY.Password)
//                    UserDefaults.standard.set(userResponse.data.id, forKey: USERDEFAULTS_KEY.Id)
//                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
//
//                    let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "dashBoardVC") as! dashBoardVC
//                    self.navigationController!.pushViewController(thirdViewController, animated: true)
//                } else {
//                    AlertHelper.showAlert(on: self, title: "", message: "\(userResponse.message)")
//                    print("Login failed: \(userResponse.message)")
//                    SVProgressHUD.dismiss()
//
//                }
//
//            case .failure(let error):
//                AlertHelper.showAlert(on: self, title: "", message: "Login failed")
//                print("Error: \(error.localizedDescription)")
//                SVProgressHUD.dismiss()
//
//            }
//        }
//    }
//
//    @IBAction func back(_ sender: Any) {
//        UserDefaults.standard.set(false, forKey: "isLoggedIn")
//        self.navigationController?.popViewController(animated: true)
//    }
//
//    func loginUser(email: String, password: String, completion: @escaping (Result<UserResponse, Error>) -> Void) {
//        let parameters: [String: Any] = [
//            "email": email,
//            "password": password
//        ]
//
//        AF.request(APIEndPoints.login, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                print(response.result)
//                do {
//                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
//                    let userResponse = try JSONDecoder().decode(UserResponse.self, from: jsonData)
//                    print("userResponse")
//                    completion(.success(userResponse))
//                } catch {
//                    completion(.failure(error))
//                }
//
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//}
//
//



import UIKit
import Alamofire

class signINVC: UIViewController {

    @IBOutlet weak var gmailview: UIView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var signinbtnview: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        self.signin.roundCorner()
        self.signinbtnview.roundCorner()
        self.signInBtn.roundCorner()
        self.signView.roundCorner()
        self.backBtn.roundCorner()
        self.gmailview.roundCornerWithBorder(borderColor: .gray)
        self.passwordView.roundCornerWithBorder(borderColor: .gray)
        self.backBtn.roundCorner()
        backBtn.layer.borderWidth = 1
        backBtn.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func signUpBtn(_ sender: Any) {
        let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController!.pushViewController(thirdViewController, animated: true)
    }

    @IBAction func sigbbtn(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty else {
            AlertHelper.showAlert(on: self, title: "", message: "Please Enter email")
            return
        }
        guard let password = passwordTF.text, !password.isEmpty else {
            AlertHelper.showAlert(on: self, title: "", message: "Please Enter password")
            return
        }
        
        loginUser(email: email, password: password) { result in
            switch result {
            case .success(let userResponse):
                if userResponse.success {
                    print("Login success!")
                    
                    // Save email to UserDefaults
                    UserDefaults.standard.set(email, forKey: USERDEFAULTS_KEY.Email)
                    UserDefaults.standard.set(password, forKey: USERDEFAULTS_KEY.Password)
                    UserDefaults.standard.set(userResponse.data.id, forKey: USERDEFAULTS_KEY.Id)
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    
                    let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "dashBoardVC") as! dashBoardVC
                    self.navigationController!.pushViewController(thirdViewController, animated: true)
                } else {
                    AlertHelper.showAlert(on: self, title: "", message: "\(userResponse.message)")
                    print("Login failed: \(userResponse.message)")
                }

            case .failure(let error):
                AlertHelper.showAlert(on: self, title: "", message: "Login failed")
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    @IBAction func back(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        self.navigationController?.popViewController(animated: true)
    }

    func loginUser(email: String, password: String, completion: @escaping (Result<UserResponse, Error>) -> Void) {
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]

        AF.request(APIEndPoints.login, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(response.result)
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                    let userResponse = try JSONDecoder().decode(UserResponse.self, from: jsonData)
                    print("userResponse")
                    completion(.success(userResponse))
                } catch {
                    completion(.failure(error))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

