//
//  siramanMuViewController.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 16/01/24.
//

import UIKit

struct cellData {
    var title = String()
    var opened = Bool()
    var sectionData = [String]()
}

class siramanMuViewController: UIViewController {
    
    @IBOutlet weak var tableProfile: UITableView!
    @IBOutlet weak var imageMu: UIImageView!
    
    var tableViewData = [cellData] ()
    let message = "Alamat Sekretariat: Gedung Dakwah PRM Siraman, Siraman II, Siraman, Wonosari, Gunungkidul, DIY."

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageMu.image = UIImage(named: "headerMuh")
        self.tableProfile.separatorColor = UIColor.clear
        setupTableView()
        tableViewData = [cellData(title: "Profile", opened: false, sectionData: [
            "Pimpinan Ranting Muhammadiyah Siraman",
            "\(message)",
            "Nomor Telepon: 087731252060",
            "Akun Media Sosial: Instagram @prmsiraman"]),
                         cellData(title: "Visi", opened: false, sectionData: ["''Mewujudkan Ranting Siraman yang maju, mandiri, dan manfaat menuju terciptanya masyarakat Islam yang sebenar-benarnya''"]),
                         cellData(title: "Misi", opened: false, sectionData: ["1. Menyebarluaskan ajaran Islam yang murni sesuai Al-Qur'an dan As-Sunnah melalui dakwah bil hikmah dan inovatif dengan bercirikan Islam yang rahmatan lil 'alamin",
                            "2. Membina dan menggerakkan angkatan muda sehingga menjadi kader Muhammadiyah, kader agama, dan kader bangsa yang berkomitmen tinggi dan berkompetensi",
                            "3. Menciptakan organisasi yang mandiri melalui usaha pengembangan ekonomi berbasis kreatifitas dan potensi lokal",
                            "4. Meningkatkan kepekaan dan kepedulian terhadap problematika masyarakat dengan menghadirkan program kerja dan kegiatan yang solutif"]) ]
        
    }
    private func setupTableView() {
        tableProfile.dataSource = self
        tableProfile.delegate = self
        tableProfile.register(cellTitle.nib, forCellReuseIdentifier: cellTitle.identifier)
        tableProfile.register(cellSection.nib, forCellReuseIdentifier: cellSection.identifier)
    }
    }

extension siramanMuViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellTitle.identifier) as? cellTitle  else
            {return UITableViewCell()}
            cell.separatorInset =  UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            cell.selectionStyle = .none
            cell.labelTitle?.text = tableViewData[indexPath.section].title
            cell.imageArrow.image = tableViewData[indexPath.section].opened ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
            return cell
        }
        else {
            guard let cellsection = tableView.dequeueReusableCell(withIdentifier: cellSection.identifier) as? cellSection else
            {return UITableViewCell()}
            cellsection.selectionStyle = .none
            cellsection.separatorInset =  UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 20)
            cellsection.labelSection?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            return cellsection
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        } else {
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
    }

