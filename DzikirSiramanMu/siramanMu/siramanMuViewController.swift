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
    let message = "Alamat Sekretariat: Gedung Dakwah PRM Siraman, Siraman II, Siraman, Wonosari, Gunungkidul, DIY. Klik link maps untuk melihat detail lokasi"
    let findWord = "Klik link maps"
//    let text = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageMu.image = UIImage(named: "headerMuh")
        self.tableProfile.separatorColor = UIColor.clear
        setupSeparator()
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
                            "4. Meningkatkan kepekaan dan kepedulian terhadap problematika masyarakat dengan menghadirkan program kerja dan kegiatan yang solutif"])                                                                ]
        
    }
    private func setupTableView() {
        tableProfile.dataSource = self
        tableProfile.delegate = self
        tableProfile.register(cellTitle.nib, forCellReuseIdentifier: cellTitle.identifier)
        tableProfile.register(cellSection.nib, forCellReuseIdentifier: cellSection.identifier)
    }
    private func setupSeparator() {
//        tableProfile.separatorStyle = .none
        }
    }
//
extension String{
    func createRangeinaLink(of findWord: String) -> NSRange {
        let range = (self as NSString).range(of: findWord, options: .caseInsensitive)
        return range
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
        let labelText = "Klik di sini untuk informasi lebih lanjut. Temukan tutorial iOS di OpenAI."
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
            //            let attributedString = NSMutableAttributedString(string: message)
            // Menambahkan hyperlink pada kata "Klik di sini"
            //            let range1 = (message as NSString).range(of: "Klik link maps")
            //            attributedString.addAttribute(.link, value: "https://maps.app.goo.gl/KxFFcT7bTjr3oJGWA", range: range1)
            //            cellsection.labelSection?.attributedText = attributedString
            //            cellsection.labelSection?.isUserInteractionEnabled = true
            if indexPath.section == 0 && indexPath.row == 2 {
                let attributeMutableStringLink = NSMutableAttributedString(string: message)
                attributeMutableStringLink.addAttribute( .link, value: "https://maps.app.goo.gl/KxFFcT7bTjr3oJGWA", range: message.createRangeinaLink(of: findWord))
                cellsection.labelSection?.attributedText = attributeMutableStringLink
                cellsection.labelSection?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel(_:))))
            } else {
                cellsection.labelSection?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            }
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
    @objc func handleTapOnLabel(_ gesture: UITapGestureRecognizer) {
            if let label = gesture.view as? UILabel {
                let layoutManager = NSLayoutManager()
                let textContainer = NSTextContainer(size: label.bounds.size)
                let storage = NSTextStorage(attributedString: label.attributedText!)
    
                layoutManager.addTextContainer(textContainer)
                storage.addLayoutManager(layoutManager)
    
                let location = gesture.location(in: label)
                let index = layoutManager.characterIndex(for: location, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
    
                label.attributedText?.enumerateAttribute(.link, in: NSRange(location: 0, length: label.attributedText!.length), options: []) { value, range, stop in
                    if let url = value as? URL, NSLocationInRange(index, range) {
                        // Handle aksi ketika hyperlink di-tap, misalnya membuka URL
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            }
        }
    }

