//
//  changePVC.swift
//  comera
//
//  Created by Mac on 14/03/24.
//

import UIKit
import Alamofire
import SVProgressHUD

class changePVC: UIViewController {

    @IBOutlet weak var newpasswordTf: UITextField!
    @IBOutlet weak var currentpasswordTF: UITextField!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var changeView: UIView!
    @IBOutlet weak var newPView: UIView!
    @IBOutlet weak var currentPView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    
   
    
    
    
    func changePassword(currentPassword: String, newPassword: String, completion: @escaping (Bool, String?) -> Void) {
          guard let userId = UserDefaults.standard.value(forKey: USERDEFAULTS_KEY.Id) as? String else {
              completion(false, "User id not found")
              return
          }

          // API endpoint
//          let urlString = "https://sysqbit.com/vpn/api/change-password"
          
          // Request parameters
          let parameters: [String: Any] = [
              "id": userId,
              "current_password": currentPassword,
              "new_password": newPassword
          ]
          
          // Make Alamofire POST request
        AF.request(APIEndPoints.changePassword, method: .post, parameters: parameters, encoding: JSONEncoding.default)
              .validate()
              .responseJSON { response in
                  switch response.result {
                  case .success(let value):
                      if let json = value as? [String: Any],
                         let success = json["success"] as? Bool,
                         let message = json["messages"] as? String {
                          completion(success, message)
                      } else {
                          completion(false, "Invalid response format")
                      }
                      
                  case .failure(let error):
                      completion(false, error.localizedDescription)
                  }
              }
      }
    
    
    
    
    

    
    
    
    @IBAction func changepassword(_ sender: Any) {
            guard let currentpassword = currentpasswordTF.text, !currentpassword.isEmpty else {
                AlertHelper.showAlert(on: self, title: "", message: "Please Enter current password")
                return
            }
            guard let newpassword = newpasswordTf.text, !newpassword.isEmpty else {
                AlertHelper.showAlert(on: self, title: "", message: "Please Enter new password")
                return
            }
        SVProgressHUD.show()
            changePassword(currentPassword: currentpassword, newPassword: newpassword) { success, message in
                if success {
                    DispatchQueue.main.async {
                        // Password changed successfully
                        // You can show an alert or perform any other action here
                        print("Password changed successfully: \(message ?? "")")
                        SVProgressHUD.dismiss()

                        let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "dashBoardVC") as! dashBoardVC
                        self.navigationController!.pushViewController(thirdViewController, animated: true)
                    }
                } else {
                    DispatchQueue.main.async {
                        // Failed to change password
                        // You can show an alert or perform any other action here
                        print("Failed to change password: \(message ?? "")")
                        SVProgressHUD.dismiss()

                    }
                }
            }
        }
    
    
    func setup(){
        self.newPView.roundCornerWithBorder(borderColor: .gray)
        self.currentPView.roundCornerWithBorder(borderColor: .gray)
        self.changeBtn.roundCorner()
        self.changeView.roundCorner()
        self.navigationController?.isNavigationBarHidden = true

    }
   

}
