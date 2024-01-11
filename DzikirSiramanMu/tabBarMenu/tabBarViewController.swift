//
//  tabBarViewController.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 11/01/24.
//

import UIKit

class tabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       let home = comingSoonView ()
        let jadwal = comingSoonView ()
        let dzikir = DzikirViewController ()
        
        home.title = "SiramanMu"
        jadwal.title = "Jadwal Kajian"
        dzikir.title = "Dzikir"
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
