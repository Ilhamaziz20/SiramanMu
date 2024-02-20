//
//  jadwalKegiatan.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 23/01/24.
//

import UIKit

struct Post:Codable{
    let title: String
    let description: String
    let date: String
    let speaker: String
    let location: String
    let longitude: String
}

class jadwalKegiatan: UIViewController {
    @IBOutlet weak var textJudul: UILabel!
    @IBOutlet weak var imagePRM: UIImageView!
    @IBOutlet weak var tableKajian: UITableView!
    @IBOutlet weak var horizontalLine: UIView!
    @IBOutlet weak var viewErrorHandler: UIView!
    @IBOutlet weak var labelError: UILabel!
    
    
    var rePost = [Post]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.labelError.text = .none
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rePost = []
        setupTableView()
        self.imagePRM.image = UIImage(named: "headerPRM")
        self.textJudul.text = "Informasi Kajian"
        decodeAPI {
            self.tableKajian.reloadData()
        }
        
        
    }
    private func setupTableView() {
        tableKajian.dataSource = self
        tableKajian.delegate = self
        tableKajian.register(cellKajian.nib , forCellReuseIdentifier: cellKajian.identifier)
    }
    func decodeAPI (completed: @escaping () -> ()) {
        
        guard let url = URL(string: "https://65b1214dd16d31d11bde2779.mockapi.io/api/v1/geteventslist") else{return}
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if error != nil {
                // cara mengetahui response error berapa
                let httpResponse = response as! HTTPURLResponse
                // cara menampilkan message error
                let messageError = "Mohon maaf terjadi kesalahan,\nStatus Code: \(httpResponse.statusCode)"
                self.showAPIErrorAlert(message: messageError)
                self.labelError.text = "Mohon maaf, tidak ada event untuk saat ini."
                self.viewErrorHandler.isHidden = false
                self.tableKajian.isHidden = true
                DispatchQueue.main.async {
                    completed()
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
            }
            
            let decoder = JSONDecoder()
            
            if let data = data{
                do{
                    let tasks = try decoder.decode([Post].self, from: data)
                    self.rePost = tasks
                    
                    
                    DispatchQueue.main.async {
                        self.viewErrorHandler.isHidden = true
                        self.tableKajian.isHidden = false
                        completed()
                    }
                }catch{
                    let httpResponse = response as! HTTPURLResponse
                    let messageError = "Mohon maaf terjadi kesalahan,\nStatus Code: \(httpResponse.statusCode)"
                    self.showAPIErrorAlert(message: messageError)
                    self.labelError.text = "Mohon maaf, tidak ada event untuk saat ini."
                    self.viewErrorHandler.isHidden = false
                    self.tableKajian.isHidden = true
                    DispatchQueue.main.async {
                        completed()
                    }
                }
            }
        }
        task.resume()
    }
    func showAPIErrorAlert(message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            // Tampilkan alert di atas tampilan saat ini
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
extension jadwalKegiatan: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rePost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: cellKajian.identifier, for: indexPath) as! cellKajian
        
        cell.selectionStyle = .none
        cell.configureData(data: rePost[indexPath.row])
        
        return cell
    }
}
