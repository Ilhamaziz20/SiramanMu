//
//  mainDzikirCollectionViewCell.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 27/12/23.
//

import UIKit
struct isiDzikir {
    var icon: String?
    var label: String?
}
class mainDzikirCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabelColl: UILabel!
    @IBOutlet weak var imageIconColl: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(data: isiDzikir) {
        self.imageIconColl.image = UIImage(named: data.icon ?? "")
        self.textLabelColl.text = data.label
    }
}
