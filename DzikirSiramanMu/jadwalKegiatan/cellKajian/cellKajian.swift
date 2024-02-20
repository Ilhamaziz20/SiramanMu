//
//  cellKajian.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 26/01/24.
//

import UIKit

class cellKajian: UITableViewCell {

    @IBOutlet weak var labelJudul: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelTanggal: UILabel!
    @IBOutlet weak var labelNarsum: UILabel!
    @IBOutlet weak var labelLokasi: UILabel!
    @IBOutlet weak var labelMap: UILabel!
    
    @IBOutlet weak var labelTitleValue: UILabel!
    @IBOutlet weak var labelTanggalValue: UILabel!
    @IBOutlet weak var labelNarsumValue: UILabel!
    @IBOutlet weak var labelLokasiValue: UILabel!
    @IBOutlet weak var labelMapValue: UILabel!
    
    static let identifier = "cellKajian"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView() {
        labelTitle.text = "Judul"
        labelTanggal.text = "Tanggal & Jam"
        labelNarsum.text = "Narasumber"
        labelLokasi.text = "Lokasi"
        labelMap.text = "Link Map"
        // code yg statis
        
    }
    
    func configureData(data: Post){
        labelJudul.text = data.title.capitalized
        labelTitleValue.text = data.description
        labelTanggalValue.text = DateManager.convertDateFormat(inputDateString: data.date)
        labelNarsumValue.text = data.speaker
        labelLokasiValue.text = data.location
        labelMapValue.text = data.longitude
        let attributedString = NSAttributedString(string: labelMapValue.text ?? "", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
            labelMapValue.attributedText = attributedString
        
        labelMapValue.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        labelMapValue.addGestureRecognizer(tapGesture)
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        let longitude = labelMapValue.text ?? ""
        
        if let url = URL(string: longitude) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
