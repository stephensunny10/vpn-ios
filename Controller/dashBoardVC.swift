//
//  dashBoardVC.swift
//  comera
//
//  Created by Mac on 14/03/24.
//



import UIKit

class dashBoardVC: UIViewController, UITableViewDataSource ,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return menuItems.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
         cell.textLabel?.text = menuItems[indexPath.row]
         cell.imageView?.image = menuImages[indexPath.row] // Set the image view to the corresponding menu image

         return cell
     }
     
     // MARK: - UITableViewDelegate methods
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // Deselect the tapped row
        
        switch indexPath.row {
        case 0: // Navigate to first view controller
            let firstViewController = self.storyboard!.instantiateViewController(withIdentifier: "dashBoardVC") as! dashBoardVC
            self.navigationController!.pushViewController(firstViewController, animated: true)
        case 1: // Navigate to second view controller
            let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "profileVC") as! profileVC
            self.navigationController!.pushViewController(secondViewController, animated: true)
        case 2: // Navigate to third view controller
            let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "servicesVC") as! servicesVC
            self.navigationController!.pushViewController(thirdViewController, animated: true)
        case 3: // Navigate to first view controller
            let firstViewController = self.storyboard!.instantiateViewController(withIdentifier: "subscriptionVC") as! subscriptionVC
            self.navigationController!.pushViewController(firstViewController, animated: true)
        case 4: // Navigate to second view controller
            let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "settingVc") as! settingVc
            self.navigationController!.pushViewController(secondViewController, animated: true)
        case 5: // Navigate to third view controller
            let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "T_CVC") as! T_CVC
            self.navigationController!.pushViewController(thirdViewController, animated: true)
        case 6: // Navigate to third view controller
            let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "privacyPolicyVC") as! privacyPolicyVC
            self.navigationController!.pushViewController(thirdViewController, animated: true)
        default:
            break
        }
        
        closeSideMenu()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
    
    var sideMenuView: UIView!
       var isMenuVisible = false

    @IBOutlet weak var notconnectedlabel: UILabel!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var PreView: UIView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var middleView: UIView!
    let myColor : UIColor = UIColor( red:0.0/255 , green:201.0/255, blue:222.0/255, alpha: 1.0 )

    let unselectedImage = UIImage(named: "icons8-power-52")
    let selectedImage = UIImage(named: "icons8-close-50")
    let sidemenuImage = UIImage(named: "ic_drawer_menu")
    var isButtonVisible = true
    var tableView: UITableView!
       var menuItems = ["Home", "Profile", "Services","Go premiun", "Settings", "Terms and conditions","Privacy Policy"]
    let menuImages: [UIImage?] = [UIImage(named: "power"), // Replace "homeIcon" with the name of your image asset
                                  UIImage(named: "profileIcon"),
                                  UIImage(named: "servicesIcon"),
                                  UIImage(named: "premiumIcon"),
                                  UIImage(named: "settingsIcon"),
                                  UIImage(named: "termsIcon"),
                                  UIImage(named: "privacyIcon")]
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
//        if let savedEmail = UserDefaults.standard.string(forKey: USERDEFAULTS_KEY.Email) {
//                   print("Retrieved Email: \(savedEmail)")
//                   // Do something with the retrieved email, such as displaying it in a label
//                   // userEmailLabel.text = savedEmail
//               } else {
//                   print("No saved email found")
//               }
           
        
        
        // Setup side menu view
        setupSideMenu()
        
        // Setup button to open side menu
        setupButton()
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//                tapGesture.cancelsTouchesInView = false
//                self.view.addGestureRecognizer(tapGesture)
    }
    
    
    func setupSideMenu() {
        sideMenuView = UIView(frame: CGRect(x: -self.view.frame.width, y: 0, width: self.view.frame.width * 0.8, height: self.view.frame.height))
        sideMenuView.backgroundColor = .white
        self.view.addSubview(sideMenuView)
        
        // Setup UITableView
        tableView = UITableView(frame: CGRect(x: 0, y: 60, width: sideMenuView.frame.width, height:  480))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.reloadData()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
        sideMenuView.addSubview(tableView)
        
        // Add logout button below the table view6
        let logoutButton = UIButton(frame: CGRect(x: -100, y: 500, width: sideMenuView.frame.width, height: 60))
        logoutButton.setTitle("Log Out", for: .normal)
        logoutButton.setTitleColor(.black, for: .normal)
        logoutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        sideMenuView.addSubview(logoutButton)
        
        // Add gray line above the logout button
        let grayLine = UIView(frame: CGRect(x: 20, y: 480, width: sideMenuView.frame.width - 40, height: 1))
        grayLine.backgroundColor = .black
        sideMenuView.addSubview(grayLine)
        
//        let closeButton = UIButton(frame: CGRect(x: sideMenuView.frame.width - 50, y: 20, width: 30, height: 30))
//        closeButton.setTitle("X", for: .normal)
//        closeButton.addTarget(self, action: #selector(closeSideMenu), for: .touchUpInside)
//        sideMenuView.addSubview(closeButton)
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        tapGesture.cancelsTouchesInView = false
//        self.view.addGestureRecognizer(tapGesture)
    }

    @objc func logOut() {
        // Implement your logout logic here
        print("User logged out")
    }

    
    




    func setupButton() {
        let button = UIButton(frame: CGRect(x: 30, y: 70, width: 30, height: 30))
        button.setImage(sidemenuImage, for: .normal)

        button.backgroundColor = .clear
        button.tintColor = .white // Set tint color to white
        button.addTarget(self, action: #selector(openSideMenu), for: .touchUpInside)
        self.view.addSubview(button)
    }

    @objc func openSideMenu() {
        if !isMenuVisible {
            UIView.animate(withDuration: 0.3) {
                self.sideMenuView.frame.origin.x = 0
                // Hide the button
                self.hideButton()
            }
            isMenuVisible = true
        }
    }

    @objc func closeSideMenu() {
        if isMenuVisible {
            UIView.animate(withDuration: 0.3) {
                self.sideMenuView.frame.origin.x = -self.view.frame.width
                // Show the button
                self.showButton()
            }
            isMenuVisible = false
        }
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        if isMenuVisible {
            closeSideMenu()
        }
    }

    func hideButton() {
        if isButtonVisible {
            UIView.animate(withDuration: 0.3) {
                self.view.subviews.first(where: { $0 is UIButton })?.alpha = 0.0
            }
            isButtonVisible = false
        }
    }

    func showButton() {
        if !isButtonVisible {
            UIView.animate(withDuration: 0.3) {
                self.view.subviews.first(where: { $0 is UIButton })?.alpha = 1.0
            }
            isButtonVisible = true
        }
    }

    func setup(){
        self.powerBtn.roundCorner()
        powerBtn.layer.borderWidth = 10
        powerBtn.layer.borderColor = myColor.cgColor
        if let image = powerBtn.imageView?.image {
            powerBtn.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
           }

           // Set the tint color of the button
        powerBtn.tintColor = UIColor.white
       

//        self.middleView.roundCorner()
        self.PreView.roundCorner()
        self.btn.roundCorner()
        middleView.layer.cornerRadius = 25.0
        timeView.isHidden = true
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "loactionVC") as! loactionVC
        self.navigationController!.pushViewController(thirdViewController, animated: true)
    }
    
    @IBAction func premiumBtn(_ sender: Any) {
        let thirdViewController = self.storyboard!.instantiateViewController(withIdentifier: "subscriptionVC") as! subscriptionVC
        self.navigationController!.pushViewController(thirdViewController, animated: true)
    }
    

    
    @IBAction func powerbtn(_ sender: Any) {
        self.powerBtn.isSelected = !self.powerBtn.isSelected

        if self.powerBtn.isSelected {
            if let image = selectedImage {
                powerBtn.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
                powerBtn.tintColor = UIColor.white
            }

            notconnectedlabel.isHidden = true
            timeView.isHidden = false
        } else {
            if let image = unselectedImage {
                powerBtn.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
                powerBtn.tintColor = UIColor.white
            }

            notconnectedlabel.isHidden = false
            timeView.isHidden = true
        }
    }

}
