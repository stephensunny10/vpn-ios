

import UIKit
import Alamofire
import SVProgressHUD

class loactionVC: UIViewController {
    
    var servers: [Server] = []
    var imageLoadedCounter = 0 // Counter to track the number of images loaded
    var dataLoadedCounter = 0 // Counter to track the number of servers whose data is loaded

    @IBOutlet weak var locationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationTableView.delegate = self
        locationTableView.dataSource = self
        fetchDataFromAPI()
        SVProgressHUD.show()

    }
    
    @IBAction func back(_ sender: Any) {
        SVProgressHUD.dismiss()

        self.navigationController?.popViewController(animated: true)
    }
    
    func fetchDataFromAPI() {
//           let apiUrl = "https://sysqbit.com/vpn/api/server"
           
        AF.request(APIEndPoints.server, method: .get).validate().responseJSON { response in
               switch response.result {
               case .success(let value):
                   if let jsonResponse = value as? [String: Any],
                      let data = jsonResponse["data"] as? [[String: Any]] {
                       self.parseResponse(data: data)
                   }
               case .failure(let error):
                   print("Error fetching data: \(error)")
               }
           }
       }

    
    struct Server {
        let id: String
        let name: String
        let country: String
        let serverAddress: String
        let vpnConfiguration: String
        let username: String
        let password: String
        let isPremium: String
        let status: String
        let createdAt: String
        let flagURL: URL
        var image: UIImage?
    }
    
    
    func parseResponse(data: [[String: Any]]) {
           var loadedServers: [Server] = []
           let group = DispatchGroup() // Dispatch group to wait for all asynchronous tasks
           
           for serverData in data {
               group.enter() // Enter the dispatch group
               
               if let id = serverData["id"] as? String,
                  let name = serverData["name"] as? String,
                  let country = serverData["country"] as? String,
                  let serverAddress = serverData["server_address"] as? String,
                  let vpnConfiguration = serverData["vpn_configuration"] as? String,
                  let username = serverData["username"] as? String,
                  let password = serverData["password"] as? String,
                  let isPremium = serverData["is_premium"] as? String,
                  let status = serverData["status"] as? String,
                  let createdAt = serverData["created_at"] as? String,
                  let flagName = serverData["flag"] as? String,
                  let flagURL = URL(string: "https://sysqbit.com/vpn/public/assets/img/flags-medium/\(flagName)") {

                   // Load image for each server
                   DispatchQueue.global().async {
                       if let data = try? Data(contentsOf: flagURL),
                          let image = UIImage(data: data) {
                           DispatchQueue.main.async {
                               let server = Server(id: id,
                                                   name: name,
                                                   country: country,
                                                   serverAddress: serverAddress,
                                                   vpnConfiguration: vpnConfiguration,
                                                   username: username,
                                                   password: password,
                                                   isPremium: isPremium,
                                                   status: status,
                                                   createdAt: createdAt,
                                                   flagURL: flagURL,
                                                   image: image) // Add the loaded image to the server object
                               
                               loadedServers.append(server)
                               group.leave() // Leave the dispatch group
                           }
                       } else {
                           group.leave() // Leave the dispatch group
                       }
                   }
               }
           }
           
           group.notify(queue: .main) {
               // All asynchronous tasks are completed
               self.servers = loadedServers
               self.locationTableView.reloadData()
               SVProgressHUD.dismiss()
           }
       }
    

}

extension loactionVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = locationTableView.dequeueReusableCell(withIdentifier: "locationTVCell", for: indexPath) as! locationTVCell
           let server = servers[indexPath.row]
           
           cell.countrylabel.text = server.country
           
           // Round the corners of the flagImageView
           cell.flageimageview.layer.cornerRadius = 25 // half of 50 (width/2)
           cell.flageimageview.clipsToBounds = true
           
           DispatchQueue.global().async {
               if let data = try? Data(contentsOf: server.flagURL),
                  let image = UIImage(data: data) {
                   DispatchQueue.main.async {
                       cell.flageimageview.image = image
                       print( server.flagURL)
                       
                       // Increment the counter and check if all images are loaded
                       self.imageLoadedCounter += 1
                       if self.imageLoadedCounter == self.servers.count {
                           SVProgressHUD.dismiss()
                       }
                   }
               }
           }
           
           return cell
       }
    

    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "dashBoardVC") as? dashBoardVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
