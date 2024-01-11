//
//  dzikirSholatCell.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 03/01/24.
//

import UIKit

class dzikirSholatCell: UITableViewCell {
    @IBOutlet weak var textDzikirSholat: UILabel!
    @IBOutlet weak var textArti: UILabel!
    static let identifier = "dzikirSholatCell"
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
