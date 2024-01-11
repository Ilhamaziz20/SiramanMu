//
//  mainMenuDzikirViewController.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 27/12/23.
//

import UIKit

class mainMenuDzikirViewController: UIViewController {
    
    @IBOutlet weak var textLabelTop: UILabel!
    @IBOutlet weak var txtLabelBottom: UILabel!
    @IBOutlet weak var dzikirCollectionView: UICollectionView!
    
    var isiDataDzikir: [isiDzikir] = [
        isiDzikir(icon: "koran", label: "Dzikir Pagi & Petang"),
        isiDzikir(icon: "praying", label: "Dzikir Setelah Sholat"),
        isiDzikir(icon: "ramadan", label: "Do'a Sehari-hari")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textLabelTop.text = "SiramanMu Dzikir"
        self.txtLabelBottom.text = "Dzikir & Do'a"
        self.setupCollectionView()
        // Do any additional setup after loading the view.
    }
    func setupCollectionView () {
        self.dzikirCollectionView.delegate = self
        self.dzikirCollectionView.dataSource = self
        self.dzikirCollectionView.register(UINib(nibName: "mainDzikirCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mainDzikirCollectionViewCell")
    }}
extension mainMenuDzikirViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.isiDataDzikir.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainDzikirCollectionViewCell", for: indexPath) as? mainDzikirCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(data: self.isiDataDzikir[indexPath.row] )
        return cell
    }
    //navigation next button
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menudetail = detailDzikirPagiView()
        let menudetailsholat = detailDzikirSholatView ()
        let menucoming = comingSoonView()
        if indexPath.row == 0 {
            navigationController?.pushViewController(menudetail, animated: true)}
        if indexPath.row == 1 {
            navigationController?.pushViewController(menudetailsholat, animated: true)
        }
        if indexPath.row == 2 {
            navigationController?.pushViewController(menucoming, animated: true)
        }
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

