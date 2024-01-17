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
        self.setupTabs()
        self.selectedIndex = 0
    }
    private func setupTabs () {
        let vcHome = siramanMuViewController()
        vcHome.navigationController?.isNavigationBarHidden = true
        let home = self.createNav(with: "SiramanMu", and: UIImage(systemName: "building"), vc: vcHome)
        
        let vcJadwal = comingSoonView()
        vcJadwal.navigationController?.isNavigationBarHidden = true
        let jadwal = self.createNav(with: "Jadwal Kegiatan", and: UIImage (systemName: "calendar.badge.clock"), vc: vcJadwal)
        
        let vcDzikir = mainMenuDzikirViewController()
        vcDzikir.navigationController?.isNavigationBarHidden = true
        let dzikir = self.createNav(with: "Dzikir", and: UIImage (systemName: "book.circle"), vc: vcDzikir)
        
        self.setViewControllers([home, jadwal, dzikir], animated: true)
    }
//
//    private func setupTabs() {
//        let home = self.createNav(with: "SiramanMu", and: UIImage(systemName: "building"), vc: comingSoonView())
//        let jadwal = self.createNav(with: "Jadwal Kegiatan", and: UIImage(systemName: "calendar.badge.clock"), vc: comingSoonView())
//        let dzikir = self.createNav(with: "Dzikir", and: UIImage(systemName: "book.circle"), vc: mainMenuDzikirViewController())
//        self.setViewControllers([home,jadwal,dzikir], animated: true)
//    }
    private func createNav(with title: String?, and image:UIImage?, vc : UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: nil, action: nil)
        return nav
    }
}
