//
//  cellTitle.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 18/01/24.
//

import UIKit

class cellTitle: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageArrow: UIImageView!
    static let identifier = "cellTitle"
    static var nib: UINib {
        return UINib(nibName:(String(describing: self)), bundle: nil)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        labelTitle.textColor = hexStringToUIColor("007AFF")
        labelTitle.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func hexStringToUIColor(_ hex: String) -> UIColor {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
                hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
                var rgb: UInt64 = 0
                Scanner(string: hexSanitized).scanHexInt64(&rgb)
                let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
                let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
                let blue = CGFloat(rgb & 0x0000FF) / 255.0
                return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            }
    }

