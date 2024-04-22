//
//  profileVC.swift
//  comera
//
//  Created by Mac on 14/03/24.
//



import UIKit

class profileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editBtn(_ sender: Any) {
        let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "editProfileVC") as! editProfileVC
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    
    @IBAction func changeBtn(_ sender: Any) {
        let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "changePVC") as! changePVC
        self.navigationController!.pushViewController(secondViewController, animated: true)
        print("next")
    }
    
    @IBAction func logoutbtn(_ sender: Any) {
        showDialog(title: "Alert", message: "Are you sure you want to logout?") { _ in
            // Handle "Yes" button press
            self.logout()
        }
    }
    
    private func logout() {
        // Clear user credentials from UserDefaults
        UserDefaults.standard.removeObject(forKey: USERDEFAULTS_KEY.Email)
        UserDefaults.standard.removeObject(forKey: USERDEFAULTS_KEY.Password)
        UserDefaults.standard.removeObject(forKey: USERDEFAULTS_KEY.Id)
        
        // Set isLoggedIn to false
        UserDefaults.standard.set(false, forKey: USERDEFAULTS_KEY.isLoggedIn)
        
        // Navigate to login
        navigateToLogin()
    }
    
    func navigateToLogin() {
        let dashboardVC = self.storyboard!.instantiateViewController(withIdentifier: "signINVC") as! signINVC
        self.navigationController!.pushViewController(dashboardVC, animated: false)
    }
    
    func showDialog(title: String, message: String, handler: @escaping (UIAlertAction) -> Void) {
        // Create the alert controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        // Create "No" button
        let noButton = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertController.addAction(noButton)

        // Create "Yes" button
        let yesButton = UIAlertAction(title: "Yes", style: .default, handler: handler)
        alertController.addAction(yesButton)

        // Present the alert
        if let presentingViewController = UIApplication.shared.windows.first?.rootViewController {
            presentingViewController.present(alertController, animated: true, completion: nil)
        }
    }
}
