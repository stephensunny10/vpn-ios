//
//  subscriptionVC.swift
//  comera
//
//  Created by Mac on 14/03/24.
//

//import UIKit
//
//class subscriptionVC: UIViewController {
//    @IBOutlet weak var backbtn: UIButton!
//
//    @IBOutlet weak var startSubbtn: UIButton!
//    @IBOutlet weak var startSubview: UIView!
//    @IBOutlet weak var thirdmonthView: UIView!
//    @IBOutlet weak var secondmonthview: UIView!
//    @IBOutlet weak var oneMView: UIView!
//    @IBOutlet weak var thirdImageView: UIImageView!
//    @IBOutlet weak var secondimgView: UIImageView!
//    @IBOutlet weak var firstimgView: UIImageView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
// setup()
//        // Do any additional setup after loading the view.
//    }
//
//    @IBAction func back(_ sender: Any) {
//        self.navigationController?.popViewController(animated: true)
//
//    }
//
//    func setup(){
//
//        self.firstimgView.roundCorner()
//        self.secondimgView.roundCorner()
//        self.thirdImageView.roundCorner()
//        self.backbtn.roundCorner()
//        backbtn.layer.borderWidth = 1
//        backbtn.layer.borderColor = UIColor.black.cgColor
//        self.oneMView.roundCornerWithBorder(borderColor: .gray)
//        oneMView.layer.cornerRadius = 20
//        self.secondmonthview.roundCornerWithBorder(borderColor: .gray)
//        secondmonthview.layer.cornerRadius = 20
//        self.thirdmonthView.roundCornerWithBorder(borderColor: .gray)
//        thirdmonthView.layer.cornerRadius = 20
//        self.startSubbtn.roundCorner()
//        self.startSubview.roundCorner()
//
//
//    }
//
//}
import UIKit
import Alamofire

class subscriptionVC: UIViewController {
    @IBOutlet weak var backbtn: UIButton!
    
    @IBOutlet weak var startSubbtn: UIButton!
    @IBOutlet weak var startSubview: UIView!
    @IBOutlet weak var thirdmonthView: UIView!
    @IBOutlet weak var secondmonthview: UIView!
    @IBOutlet weak var oneMView: UIView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var secondimgView: UIImageView!
    @IBOutlet weak var firstimgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
 setup()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    func setup(){
        
        self.firstimgView.roundCorner()
        self.secondimgView.roundCorner()
        self.thirdImageView.roundCorner()
        self.backbtn.roundCorner()
        backbtn.layer.borderWidth = 1
        backbtn.layer.borderColor = UIColor.black.cgColor
        self.oneMView.roundCornerWithBorder(borderColor: .gray)
        oneMView.layer.cornerRadius = 20
        self.secondmonthview.roundCornerWithBorder(borderColor: .gray)
        secondmonthview.layer.cornerRadius = 20
        self.thirdmonthView.roundCornerWithBorder(borderColor: .gray)
        thirdmonthView.layer.cornerRadius = 20
        self.startSubbtn.roundCorner()
        self.startSubview.roundCorner()

        
    }

    
    
    

    func fetchSubscriptionData(completion: @escaping ([Subscription]?, Error?) -> Void) {
//        let apiUrl = "https://sysqbit.com/vpn/api/subscription"
        
        AF.request(APIEndPoints.subscription).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let jsonData = value as? [String: Any],
                   let success = jsonData["success"] as? Bool,
                   success,
                   let dataArray = jsonData["data"] as? [[String: Any]] {
                    
                    var subscriptions: [Subscription] = []
                    
                    for data in dataArray {
                        if let subscription = Subscription(json: data) {
                            subscriptions.append(subscription)
                        }
                    }
                    
                    completion(subscriptions, nil)
                } else {
                    completion(nil, NSError(domain: "ParsingError", code: 100, userInfo: [NSLocalizedDescriptionKey: "Failed to parse data"]))
                }
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    struct Subscription {
        let id: String
        let name: String
        let description: String
        let price: String
        let totalPrice: String
        let duration: String
        let maxConnections: String?
        let features: String?
        let createdAt: String
        let updatedAt: String
        
        init?(json: [String: Any]) {
            guard let id = json["id"] as? String,
                  let name = json["name"] as? String,
                  let description = json["description"] as? String,
                  let price = json["price"] as? String,
                  let totalPrice = json["total_price"] as? String,
                  let duration = json["duration"] as? String,
                  let createdAt = json["created_at"] as? String,
                  let updatedAt = json["updated_at"] as? String else {
                return nil
            }
            
            self.id = id
            self.name = name
            self.description = description
            self.price = price
            self.totalPrice = totalPrice
            self.duration = duration
            self.maxConnections = json["max_connections"] as? String
            self.features = json["features"] as? String
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }
    }

    
    
    
    
    
    
    
    
    @IBAction func startsubscription(_ sender: Any) {
        fetchSubscriptionData { subscriptions, error in
                if let subscriptions = subscriptions {
                    // Handle successful data fetch
                    print("Subscriptions: \(subscriptions)")
                    
                    // Here, you can navigate to another view controller or update your UI as needed
                } else if let error = error {
                    // Handle error
                    print("Error fetching subscriptions: \(error.localizedDescription)")
                    
                    // Optionally, show an alert or update UI to inform the user about the error
                    let alertController = UIAlertController(title: "Error", message: "Failed to fetch subscriptions. Please try again later.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        }
        
