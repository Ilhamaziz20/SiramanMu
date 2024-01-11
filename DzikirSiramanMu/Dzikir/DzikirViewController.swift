//
//  DzikirViewController.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 27/12/23.
//

import UIKit
class DzikirViewController: UIViewController {

    @IBOutlet weak var labelSiramanMu: UILabel!
    @IBOutlet weak var menuDzikirCollectionView: UICollectionView!
    
    var isiData: [isiMenu] = [
    isiMenu (icon: "building" , label: "SiramanMu"),
    isiMenu (icon: "calendar.badge.clock", label: "Jadwal Kegiatan"),
    isiMenu (icon: "circle.dotted", label: "Dzikir")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.labelSiramanMu.text = "Assalmu'alaikum, "
        // Do any additional setup after loading the view.
    }
    func setupCollectionView () {
        self.menuDzikirCollectionView.delegate = self
        self.menuDzikirCollectionView.dataSource = self
        self.menuDzikirCollectionView.register(UINib(nibName: "CollectionMainDzikir", bundle: nil), forCellWithReuseIdentifier: "CollectionMainDzikir")
    }}
    
extension DzikirViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.isiData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionMainDzikir", for: indexPath) as? CollectionMainDzikir else {
            return UICollectionViewCell()
        }
        cell.configureCell(data: self.isiData[indexPath.row] )
        return cell
    }
    //navigation next button
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menudz = mainMenuDzikirViewController()
        let menucoming = comingSoonView ()
        if indexPath.row == 2 { navigationController?.pushViewController(menudz, animated: true)
        }
        else {
            navigationController?.pushViewController(menucoming, animated: true)
        }
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50, height: 50)
        //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        return CGSize(width: 70, height: 70)
        //    }
    }

